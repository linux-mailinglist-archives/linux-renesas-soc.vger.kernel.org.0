Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBCCE450534
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Nov 2021 14:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbhKONVf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 08:21:35 -0500
Received: from mail.iot.bzh ([51.75.236.24]:65250 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231669AbhKONUr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 08:20:47 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id 6B8D91B49B;
        Mon, 15 Nov 2021 14:17:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:from
        :from:in-reply-to:message-id:mime-version:references:reply-to
        :subject:subject:to:to; s=iot.bzh; bh=iD/8ScGgHyxYRSyim/LEUHDqOQ
        /t6Gf9toI7NdGvnOM=; b=WClNw81+cXhjY7/ASVO0Rth8iRMB1Fe4QCJCIckypX
        0PWijdnXv+q9b3TDw8dDp6lSUEe28sJ4txC5ns+K5MgVMHzmQAMSQGGMKGmpnARl
        D16zO2OFAyFaf0/1uIqEbeMEwJ3jvP5nLYt9knA0JGyzgfd99v19iBhCn1hsY8ln
        pQQpSHxTv9NwmVbXKaTBmYjDDmw5+E/0uOZQNcCvFe0c1zdwCuUiaS5AiIyxGyX+
        RjV7xKv6oFP66xJW9mf3wzMd9jk91/DTHxzFCSdSQl8XsNQ2jL3Q3UhNH2ad2UDL
        glPceC2w9sj9CYMUeFeq8euG/lV0u34ATLQMPZG267Yg==
Message-ID: <80842bed-86ce-3424-feac-b4c38675cea8@iot.bzh>
Date:   Mon, 15 Nov 2021 14:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH 3/3] remoteproc: Add Renesas rcar driver
Content-Language: en-US
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        geert+renesas@glider.be, linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20211027073020.17055-1-julien.massot@iot.bzh>
 <20211027073020.17055-4-julien.massot@iot.bzh>
 <20211108184252.GA1971795@p14s>
From:   Julien Massot <julien.massot@iot.bzh>
In-Reply-To: <20211108184252.GA1971795@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mathieu,

Thanks for the review !

>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>> index 9a6eedc3994a..3e87eadbaf59 100644
>> --- a/drivers/remoteproc/Kconfig
>> +++ b/drivers/remoteproc/Kconfig
>> @@ -261,6 +261,17 @@ config QCOM_WCNSS_PIL
>>   	  verified and booted with the help of the Peripheral Authentication
>>   	  System (PAS) in TrustZone.
>>   
>> +config RCAR_REMOTEPROC
>> +	tristate "Renesas RCAR remoteproc support"
> 
> It is probably a good idea to include the type of SoC being supported, something
> like:
> 
>          tristate "Renesas Gen3 RCAR remoteproc support"
> 
> That will make it easier to support future RCAR processors that may not share
> the same architecture.

Ok, changed according to Geert's suggestion to:
"Renesas R-CAR Gen3 remoteproc support"

> 
> 
>> +	depends on ARCH_RENESAS
>> +	depends on REMOTEPROC
>> +	help
>> +	  Say y here to support R-Car realtime processor via the
>> +	  remote processor framework. An elf firmware can be loaded
>> +	  thanks to sysfs remoteproc entries. The remote processor
>> +	  can be started and stopped.
>> +	  This can be either built-in or a loadable module.
> 
> Please add the name of the module when compiled as such.
Ok


>> +
>> +#include "remoteproc_internal.h"
>> +
>> +struct rcar_rproc {
>> +	struct device			*dev;
>> +	struct rproc			*rproc;
>> +	struct reset_control            *rst;
>> +};
>> +
>> +static int rcar_rproc_mem_alloc(struct rproc *rproc,
>> +				 struct rproc_mem_entry *mem)
>> +{
>> +	struct device *dev = rproc->dev.parent;
>> +	void *va;
>> +
>> +	dev_dbg(dev, "map memory: %p+%zx\n", &mem->dma, mem->len);
> 
> I think this should be "map memory: %pa+%lx\n" to be consistent with dev_err()
> below and the original implementation in stm32_rproc.c.
Ok

..
>> +
>> +static int rcar_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
>> +{
>> +	int ret;
>> +
>> +	ret = rproc_elf_load_rsc_table(rproc, fw);
>> +	if (ret)
>> +		dev_info(&rproc->dev, "No resource table in elf\n");
> 
> In the above functions rproc->dev.parent is used for output.  I don't have a
> strong opinion on which of rproc->dev or rproc->dev.parent is used but I would
> like to see consistency throughout the driver.
Thanks I choosed to use rproc->dev. Indeed logs are more consistent now.
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int rcar_rproc_start(struct rproc *rproc)
>> +{
>> +	struct rcar_rproc *priv = rproc->priv;
>> +	int err;
>> +
>> +	if (!rproc->bootaddr)
>> +		return -EINVAL;
>> +
>> +	err = rcar_rst_set_rproc_boot_addr(rproc->bootaddr);
>> +	if (err) {
>> +		dev_err(&rproc->dev, "failed to set rproc boot addr\n");
> 
> Same comment as above.
ok

>> +
>> +static int rcar_rproc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *np = dev->of_node;
>> +	struct rcar_rproc *priv;
>> +	struct rproc *rproc;
>> +	int ret;
>> +
>> +	rproc = rproc_alloc(dev, np->name, &rcar_rproc_ops,
>> +			    NULL, sizeof(*priv));
>> +	if (!rproc)
>> +		return -ENOMEM;
>> +
>> +	priv = rproc->priv;
>> +	priv->rproc = rproc;
> 
> I don't see rcar_rproc::rproc being used anywhere.
Indeed, rproc member will be removed in next version.

> 
>> +	priv->dev = dev;
>> +
>> +	priv->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>> +	if (IS_ERR(priv->rst)) {
>> +		ret = PTR_ERR(priv->rst);
>> +		dev_err(dev, "fail to acquire rproc reset\n");
>> +		goto free_rproc;
>> +	}
>> +
>> +	pm_runtime_enable(priv->dev);
>> +	ret = pm_runtime_get_sync(priv->dev);
> 
> There is no dev_pm_ops for the platform driver nor clocks to manage for this
> device - is there something that requires pm_runtime operations to be called?
Will reply in Geert's reply.
>> +
>> +static int rcar_rproc_remove(struct platform_device *pdev)
>> +{
>> +	struct rproc *rproc = platform_get_drvdata(pdev);
>> +	struct rcar_rproc *priv = rproc->priv;
>> +
>> +	rproc_del(rproc);
>> +	pm_runtime_disable(priv->dev);
> 
> As far as I can tell rcar_rproc::dev is not required.  It is only used in
> rproc_probe() and rproc_remove() where pdev->dev is available.
Thanks rcar_rproc::dev will be removed in next version.


Regards,
-- 
Julien Massot [IoT.bzh]

