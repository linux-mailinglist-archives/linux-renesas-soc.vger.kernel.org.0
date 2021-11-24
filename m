Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AECFC45B8D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 12:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbhKXLKZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 06:10:25 -0500
Received: from mail.iot.bzh ([51.75.236.24]:50514 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229588AbhKXLKY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 06:10:24 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id 0C3261A35E;
        Wed, 24 Nov 2021 12:07:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:from
        :from:in-reply-to:message-id:mime-version:references:reply-to
        :subject:subject:to:to; s=iot.bzh; bh=KVKwBqXwFz0w32vfPqR77cBz/7
        te34V67c9tICosQJo=; b=W2kLpfLeR8g5F1ji/Pp2YcqRmyPdq34zFsDgYL/Avc
        EwHqP0qM/bJtUAfokxgpTCPvgQFdXXlEYgZq++UxYCfu69R+CkuY6iTzRUpsltgx
        UB8Y1T0BLt+bNtuChoMbaj+6yDJN+apBO2giywkXUMpcJAbO7CWqhqz4LuRkzfI3
        ve0SquZeG9qSJTcguaQgRSl/lKX0VgBUq3oJXGnSf74B5lzo/x+umx1oHBPanmUB
        MVWOPe+eLKwre4gHUkudruBjeHlN8iPpVLePbGB4sjXmrHiNQoY4KIa4LhQGDx+Q
        lBFqORzNp/XAuSozrwMtF3DSuwS6T3FAU8we7GlPUlTQ==
Message-ID: <8f3f6316-f2fd-4762-83ce-ccd9ce223472@iot.bzh>
Date:   Wed, 24 Nov 2021 12:07:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1 3/3] remoteproc: Add Renesas rcar driver
Content-Language: en-US
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20211115135032.129227-1-julien.massot@iot.bzh>
 <20211115135032.129227-4-julien.massot@iot.bzh>
 <20211122183758.GC2686563@p14s>
From:   Julien Massot <julien.massot@iot.bzh>
In-Reply-To: <20211122183758.GC2686563@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mathieu,
Thanks for the review !

>> +config RCAR_REMOTEPROC
>> +	tristate "Renesas R-CAR Gen3 remoteproc support"
>> +	depends on ARCH_RENESAS
>> +	depends on REMOTEPROC
> 
> You should be able to remove the dependency on REMOTEPROC since this is already in
> the "if REMOTEPROC" block.
Will fix.

...
> 
>> +
>> +	dev_dbg(dev, "map memory: %pa+%lx\n", &mem->dma, mem->len);
>> +	va = ioremap_wc(mem->dma, mem->len);
>> +	if (IS_ERR_OR_NULL(va)) {
>> +		dev_err(dev, "Unable to map memory region: %pa+%lx\n",
> 
> The sparse checker doesn't like %lx so probably be better to go with just %x.
> Apologies for suggesting to use %lx.

With %x gcc complains on arm64 build will go back to %zx.

> 
>> +			&mem->dma, mem->len);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	/* Update memory entry va */
>> +	mem->va = va;
> 
> Talking about the sparse checker, you will see complaints about @va not being of
> type "void __iomem *".  You can ignore those as this would likely require to
> refactor the rproc_mem_entry structure, which is outside the scope of this work.

Ok, to be honest, I was not aware of the sparse tool, thanks a lot to point me to
this tool.

> 
> This set is just as clean as the RFC.  If it wasn't for the DTS bindings that
> need to be ack'ed by Rob, I probably would have made the above modifications and
> applied this patch.
> 
> Thanks,
> Mathieu

No problem will send a v2.

Regards,
Julien
-- 
Julien Massot [IoT.bzh]

