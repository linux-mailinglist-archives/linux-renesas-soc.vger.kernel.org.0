Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09814450754
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Nov 2021 15:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbhKOOos (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 09:44:48 -0500
Received: from mail.iot.bzh ([51.75.236.24]:3001 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236330AbhKOOoY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 09:44:24 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id AC1341BB74;
        Mon, 15 Nov 2021 15:41:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:from
        :from:in-reply-to:message-id:mime-version:references:reply-to
        :subject:subject:to:to; s=iot.bzh; bh=j+bzqqrq+TWyqf01ZRR84hQ+Wq
        V/PrDVrNtYep63MsQ=; b=Qo0IDOn6WCcWC5mzu2auDKbNpbNagTb82VwDalaYQd
        4hIYf7x1Y0ed5TVY5gmfMrhzK3r3zsqXZbW3ywFHj2PPrWv5EnX79o3vXLXRP2ZJ
        2/0k5PE6E65mIPZAXEUP9v5I6XvPiG4ym46n91apxLipUIE1m01u9AViKPRx7CL3
        tFcJ3z4ltk6cEdtJUphT/TIWXaoWm330so9VCToQH1HN+ZBFPBxKSp++NlfAfUXb
        BW1ew7lSv27dukm6sH1GX1EETP9N2TzUdEJl6fx0ffbTTweIEqI2ysEz3sEjV804
        /gnteCFJ5/tPT/IaL4MAEh/H8MEo0EjW73lHgUAXqV+g==
Message-ID: <ebca7899-1b7e-66d4-f022-576b18b9bc95@iot.bzh>
Date:   Mon, 15 Nov 2021 15:41:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v1 3/3] remoteproc: Add Renesas rcar driver
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20211115135032.129227-1-julien.massot@iot.bzh>
 <20211115135032.129227-4-julien.massot@iot.bzh>
 <OS0PR01MB5922D67AEFD75847CE5B0DD586989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Julien Massot <julien.massot@iot.bzh>
In-Reply-To: <OS0PR01MB5922D67AEFD75847CE5B0DD586989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

> 
> One question CR7 Can be master boot processor. In that case
> How to avoid loading and booting  CR7 processor from Linux?
> Reading boot modes??
> 
Thanks for the question.

I did not test this case. There is also other scenarios where the
Cortex-R7 is started by an earlier component such as BL2, u-boot or
OP-Tee.
In these cases Linux should not try to start / stop this remote processor.
One idea could be to read the power status CR7PSTR / PWRSR7, or use
one of the MFIS register as a communication register. STM32 processor
use this last solution to indicate that the remote processor is
already started, in that scenario remoteproc driver starts in 'detached' state
instead of 'offline' state.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/remoteproc.h#n418

In that state, remoteproc driver can initiate communication with
this remote processor but will not try to start or to stop it.

That's something I have in mind, with an existing implementation there
https://github.com/iotbzh/linux/blob/iot/julien/rproc/drivers/remoteproc/rcar_rproc.c#L524
(that is not ready for upstream yet :)).

I guess this issue also exists when one device is dedicated to the secure world, so
the device exists, but not available for Linux. The most obvious (and dirty ?) solution is to keep
the device disabled in dts.

Regards,
Julien

