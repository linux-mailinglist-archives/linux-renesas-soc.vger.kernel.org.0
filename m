Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B97646C148
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Dec 2021 18:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239782AbhLGRHV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 Dec 2021 12:07:21 -0500
Received: from mail.iot.bzh ([51.75.236.24]:2363 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235159AbhLGRHV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Dec 2021 12:07:21 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id B87F245628;
        Tue,  7 Dec 2021 18:03:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:from
        :from:in-reply-to:message-id:mime-version:references:reply-to
        :subject:subject:to:to; s=iot.bzh; bh=95kJ63C8iLSh74RZfruzyxgCWL
        zqRZfg00BCSQvmIG0=; b=XWvSp1CrWQeyX5mtI0gLQ3sncOVNoOZnO49YVxOVG0
        dsrqVVuiV1m7i9fHqhQbduRTKr/O5IGx/msi27jXwUkF1rcyr2B63FtajcAKjlX0
        X0ZjZ2Ox7oLTYNHISQPD4/YhxwhnMrrokBH6T9K6fmqXUt9/e66WT01l5o+NHSSc
        GJIejrk7g24y66wWgNOmVnRITnC33Dz49gAPzOubzSWWymAwT+RstHn4gjBKpryC
        Lg2r7dwh/8niLFYmsFJs4IixfrhFbFPiJ0O/rvWiCic8rtBQNuC+yTDfmg98vas7
        zmgbmfTrCojnrBkt1TKSFriaCmU1ww9xVvX7/sEVgkpA==
Message-ID: <4cf20793-9795-4126-4293-217041101852@iot.bzh>
Date:   Tue, 7 Dec 2021 18:03:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/2] remoteproc: Add Renesas rcar driver
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     =?UTF-8?Q?Bj=c3=b6rn_Andersson?= <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20211130100049.129418-1-julien.massot@iot.bzh>
 <20211130100049.129418-3-julien.massot@iot.bzh>
 <CAMuHMdUuYHxNe_XOBGt+6cdB49zF5W0p25DbQJ0CZ7A=dE8pyg@mail.gmail.com>
From:   Julien Massot <julien.massot@iot.bzh>
In-Reply-To: <CAMuHMdUuYHxNe_XOBGt+6cdB49zF5W0p25DbQJ0CZ7A=dE8pyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,
Thanks for taking time to review my patch.

On 12/2/21 14:40, Geert Uytterhoeven wrote:
> Hi Julien,
> 
> Thanks for your patch!
> 
> On Tue, Nov 30, 2021 at 11:01 AM Julien Massot <julien.massot@iot.bzh> wrote:
>> Renesas Gen3 platform includes a Cortex-r7 processor.
>>
>> Both: the application cores (A5x) and the realtime core (CR7)
>> share access to the RAM and devices with the same address map,
>> so device addresses are equal to the Linux physical addresses.
>>
>> In order to initialize this remote processor we need to:
>> - power on the realtime core
>> - put the firmware in a ram area
> 
> RAM
fixed
> 
>> - set the boot address for this firmware (reset vector)
>> - Deassert the reset
>>
>> This initial driver allows to start and stop the Cortex R7
>> processor.
>>
>> Signed-off-by: Julien Massot <julien.massot@iot.bzh>
> 
>> --- a/drivers/remoteproc/Kconfig
>> +++ b/drivers/remoteproc/Kconfig
>> @@ -283,6 +283,17 @@ config QCOM_WCNSS_PIL
>>            verified and booted with the help of the Peripheral Authentication
>>            System (PAS) in TrustZone.
>>
>> +config RCAR_REMOTEPROC
>> +       tristate "Renesas R-CAR Gen3 remoteproc support"
> 
> R-Car
fixed
> 
>> +       depends on ARCH_RENESAS
> 
> || COMPILE_TEST?
COMPILE_TEST has been added to v3

> 
>> +       help
>> +         Say y here to support R-Car realtime processor via the
>> +         remote processor framework. An elf firmware can be loaded
> 
> ELF
ok
> 
>> +         thanks to sysfs remoteproc entries. The remote processor
>> +         can be started and stopped.
>> +         This can be either built-in or a loadable module.
>> +         If compiled as module (M), the module name is rcar_rproc.
>> +
>>   config ST_REMOTEPROC
>>          tristate "ST remoteproc support"
>>          depends on ARCH_STI
> 
>> --- /dev/null
>> +++ b/drivers/remoteproc/rcar_rproc.c
> 
>> +static int rcar_rproc_mem_alloc(struct rproc *rproc,
>> +                                struct rproc_mem_entry *mem)
>> +{
>> +       struct device *dev = &rproc->dev;
>> +       void *va;
>> +
>> +       dev_dbg(dev, "map memory: %pa+%zx\n", &mem->dma, mem->len);
>> +       va = ioremap_wc(mem->dma, mem->len);
>> +       if (IS_ERR_OR_NULL(va)) {
> 
> I think ioremap_*() never returns an error code, only NULL for failure.
Changed to check against NULL.
> 
>> +               dev_err(dev, "Unable to map memory region: %pa+%zx\n",
>> +                       &mem->dma, mem->len);
>> +               return -ENOMEM;
>> +       }
>> +
>> +       /* Update memory entry va */
>> +       mem->va = va;
>> +
>> +       return 0;
>> +}
> 
>> +static int rcar_rproc_prepare(struct rproc *rproc)
>> +{
>> +       struct device *dev = rproc->dev.parent;
>> +       struct device_node *np = dev->of_node;
>> +       struct of_phandle_iterator it;
>> +       struct rproc_mem_entry *mem;
>> +       struct reserved_mem *rmem;
>> +       u64 da;
>> +
>> +       /* Register associated reserved memory regions */
>> +       of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
>> +       while (of_phandle_iterator_next(&it) == 0) {
>> +
>> +               rmem = of_reserved_mem_lookup(it.node);
>> +               if (!rmem) {
>> +                       dev_err(&rproc->dev,
>> +                               "unable to acquire memory-region\n");
>> +                       return -EINVAL;
>> +               }
>> +
>> +               /* No need to translate pa to da, R-Car use same map */
>> +               da = rmem->base;
>> +
>> +               mem = rproc_mem_entry_init(dev, NULL,
>> +                                          (dma_addr_t)rmem->base,
> 
> Do you need this cast?
Looks like not. removed in v3

> 
>> +                                          rmem->size, da,
> 
> da is u64, and thus truncated to u32.
Ok thats indeed a limitation between the AP cores and the realtime core.
In v3 there is a check for bad input from device tree.

> 
>> +                                          rcar_rproc_mem_alloc,
>> +                                          rcar_rproc_mem_release,
>> +                                          it.node->name);
>> +
>> +               if (!mem)
>> +                       return -ENOMEM;
>> +
>> +               rproc_add_carveout(rproc, mem);
>> +       }
>> +
>> +       return 0;
>> +}
> 
>> +static int rcar_rproc_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct device_node *np = dev->of_node;
>> +       struct rcar_rproc *priv;
>> +       struct rproc *rproc;
>> +       int ret;
>> +
>> +       rproc = rproc_alloc(dev, np->name, &rcar_rproc_ops,
>> +                           NULL, sizeof(*priv));
> 
> devm_rproc_alloc(), to simplify cleanup?
Indeed devm_rproc_alloc is used in v3.
> 
>> +       if (!rproc)
>> +               return -ENOMEM;
>> +
>> +       priv = rproc->priv;
>> +
>> +       priv->rst = devm_reset_control_get_exclusive(dev, NULL);
>> +       if (IS_ERR(priv->rst)) {
>> +               ret = PTR_ERR(priv->rst);
>> +               dev_err(dev, "fail to acquire rproc reset\n");
> 
> dev_err_probe() (which handles -EPROBE_DEFER, too)
ok
> 
>> +               goto free_rproc;
>> +       }
>> +
>> +       pm_runtime_enable(dev);
>> +       ret = pm_runtime_get_sync(dev);
>> +       if (ret) {
>> +               dev_err(dev, "failed to power up\n");
>> +               goto free_rproc;
>> +       }
>> +
>> +       dev_set_drvdata(dev, rproc);
>> +
>> +       /* Manually start the rproc */
>> +       rproc->auto_boot = false;
>> +
>> +       ret = rproc_add(rproc);
> 
> devm_rproc_add()?
devm_rproc_add is now used in v3.

> 
>> +       if (ret) {
>> +               dev_err(dev, "rproc_add failed\n");
>> +               goto pm_disable;
>> +       }
>> +
>> +       return 0;
>> +
>> +pm_disable:
>> +       pm_runtime_disable(dev);
>> +free_rproc:
>> +       rproc_free(rproc);
>> +
>> +       return ret;
>> +}
> 
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_DESCRIPTION("Renesas Gen3 R-Car remote processor control driver");
> 
> R-Car Gen3
Ok

All requested changes should be addressed in v3.

Regards,
-- 
Julien Massot [IoT.bzh]

