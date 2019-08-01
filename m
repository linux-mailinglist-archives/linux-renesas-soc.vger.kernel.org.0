Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA7737E2A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2019 20:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730581AbfHASvJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Aug 2019 14:51:09 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:55773 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727899AbfHASvJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Aug 2019 14:51:09 -0400
Received: from [167.98.27.226] (helo=xylophone)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1htGAI-0003wL-VP; Thu, 01 Aug 2019 19:51:03 +0100
Message-ID: <ffe639374bd93fe76f4aed19883640fefebd08f4.camel@codethink.co.uk>
Subject: Re: [cip-dev] phy-rcar-gen3-usb2: wrong parsing of role in
 role_store?
From:   Ben Hutchings <ben.hutchings@codethink.co.uk>
To:     Pavel Machek <pavel@denx.de>, yoshihiro.shimoda.uh@renesas.com,
        kishon@ti.com, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     cip-dev@lists.cip-project.org
Date:   Thu, 01 Aug 2019 19:51:02 +0100
In-Reply-To: <20190730095140.GA29609@amd>
References: <20190730095140.GA29609@amd>
Organization: Codethink Ltd.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 2019-07-30 at 11:51 +0200, Pavel Machek wrote:
> Hi!
> 
> Code does strcmps, but does not actually check count. So AFAICT
> writing "host-I-don't-want-I-need-peripheral" into the file will
> succeed and turn it into host mode.

I suspect the intent is to work without a trailing "\n", but you're
right that this parsing is rather lax.

> Also data beyond count in buf are going to be accessed.

All attribute writes should be going through kernfs_fop_write(), which
writes a null terminator at buf[count] before calling the write/store
function.  (I don't know where that'ss documented though.)  So I think
this is safe.

Ben.

> static ssize_t role_store(struct device *dev, struct device_attribute *attr,
>                           const char *buf, size_t count)
> {
>         struct rcar_gen3_chan *ch = dev_get_drvdata(dev);
>         bool is_b_device;
>         enum phy_mode cur_mode, new_mode;
> 
>         if (!ch->is_otg_channel || !rcar_gen3_is_any_rphy_initialized(ch))
>                 return -EIO;
> 
>         /* FIXME, this is wrong */
>         if (!strncmp(buf, "host", strlen("host")))
>                 new_mode = PHY_MODE_USB_HOST;
>         else if (!strncmp(buf, "peripheral", strlen("peripheral")))
>                 new_mode = PHY_MODE_USB_DEVICE;
>         else
>                 return -EINVAL;
> 
> 
> _______________________________________________
> cip-dev mailing list
> cip-dev@lists.cip-project.org
> https://lists.cip-project.org/mailman/listinfo/cip-dev
-- 
Ben Hutchings, Software Developer                         Codethink Ltd
https://www.codethink.co.uk/                 Dale House, 35 Dale Street
                                     Manchester, M1 2HF, United Kingdom

