Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8D043ADCA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Oct 2021 10:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234229AbhJZILK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Oct 2021 04:11:10 -0400
Received: from mail.iot.bzh ([51.75.236.24]:17554 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233734AbhJZII2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 04:08:28 -0400
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id 4873320F4D;
        Tue, 26 Oct 2021 10:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:from
        :from:in-reply-to:message-id:mime-version:references:reply-to
        :subject:subject:to:to; s=iot.bzh; bh=oTbE3zSBh0x9Rb5BSbHRWbgw/v
        yrcl2SsWgBCp9ybnY=; b=IgGVg4D9+pnuKthzi1aaAVjAtNb3LdN6jM6YTmsMKy
        mk8k50/ArtLqPwepC5nGUEC+Ky/1lKRBy2EQDhhqtx4mPzHdX4jykY9UAnneubuQ
        Yi9Vy9tAdHyRQgrtb9QDWgCv44U5nj9CyQIXcyrMtD93ytKR4+FZNmzVbPqal5Fv
        Zm7RrbplXtDMH5YCLzzuR9Uqn6lFSbMuBd/AxIHV4IJ2FTRm21wtQLqjYyMrfV0p
        zmwtDifZU2ZB5wPBC48IvbKPmjWaTTlMI8+uf9CjHrJUSUzoz1EjzcMIDcPEZDaI
        KPAUAwcnZsJF0DL697wTpaCLKwBJXqRusR65NDlCSR8Q==
Message-ID: <a611a687-38e2-1183-6422-f200a56cf35b@iot.bzh>
Date:   Tue, 26 Oct 2021 10:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v4] soc: renesas: rcar-rst: Add support to set rproc boot
 address
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20211022122101.66998-1-julien.massot@iot.bzh>
 <CAMuHMdXr2W5QO0s2n+fVj6CSe1+Cmbfw0aFRkjJ2zdFaB1BSkg@mail.gmail.com>
From:   Julien Massot <julien.massot@iot.bzh>
In-Reply-To: <CAMuHMdXr2W5QO0s2n+fVj6CSe1+Cmbfw0aFRkjJ2zdFaB1BSkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,


>> +/*
>> + * Most of the R-Car Gen3 SoCs have an ARM Realtime Core.
>> + * Firmware boot address has to be set in CR7BAR before
>> + * starting the realtime core.
>> + * Boot address must be aligned on a 256k boundary.
>> + */
>> +static int rcar_rst_set_gen3_rproc_boot_addr(u64 boot_addr)
>> +{
>> +       if (boot_addr & ~(u64)CR7BAR_MASK) {
>> +               pr_warn("Invalid boot address got %llx\n", boot_addr);
> 
> pr_err
> 
>> +               return -EINVAL;
>> +       }
>> +
>> +       iowrite32((u32)boot_addr, rcar_rst_base + CR7BAR);
>> +       iowrite32((u32)boot_addr | CR7BAREN, rcar_rst_base + CR7BAR);
> 
> These casts to u32 are not needed.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v5.17, with the above fixed
> (no need to resend).

Thanks, will send initial remoteproc support soon then !

Regards,
Julien

