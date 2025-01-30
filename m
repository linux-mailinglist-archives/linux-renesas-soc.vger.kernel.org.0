Return-Path: <linux-renesas-soc+bounces-12726-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 946E1A227AA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 03:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C4D37A11BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 02:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FB31DFF8;
	Thu, 30 Jan 2025 02:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2nGbi0T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318111854;
	Thu, 30 Jan 2025 02:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738204248; cv=none; b=FaLvZth9sRCmzj1hqzrYzhYIOWgZnnKBLkHcdSe/9IToXuIQ2H4NtEE94d8OAq/6OnF5tvT5ryVYamOHN9Ny7kMV2vM1Ni85JyxCGxb31EE1SLSndXgIYgX+TO0JTPCVPX3WyyaJpr9VZHRG2LwDRl+4/fwWXrpzOTYVK5yK2d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738204248; c=relaxed/simple;
	bh=e4jbTg/JY2I7eJPj0aXC/9HSq2Ljb5HCCsZGm12Jwr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OHMkmg6wp4hyiZLWA7Nstryu/ODyUC7W84Zw5EHZUEQvqzRL9Pkosod4i2b/dALtJLFW8QM/bF5Fqz5qPJCClI/JqnLwmt39cvcXFds61P8Z6kMg7OtM7CoVlcIihpITE8mY0OOplubIC+pu5oMmmGiJsf2/d26be+REL5nAkxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2nGbi0T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B50C2C4CED1;
	Thu, 30 Jan 2025 02:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738204247;
	bh=e4jbTg/JY2I7eJPj0aXC/9HSq2Ljb5HCCsZGm12Jwr0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y2nGbi0T6W0Oi8KOuLylVn2xAg2yXpQ2n5IISfJfVxbHKfSqWlxGXS5zVm7Do/Gio
	 7bp8aPT5RgM3Wo4MacJLJlpnGqbmB6ttpLNLme1jLj2+I20HUBQECEvrVz6Pd36Yu3
	 L9yEuGCVz/cJPl3Fr/tvqGhi2vq9UIH7kgzlEodzDg06ftpHLiVS3qbBkS2D6mZI1/
	 OUAdyzBIDYiI6eKfFnpbmuI2UKzoPdbzDqDmvvdqOa6Sfub4EVNYBdlVElNLKqtVgw
	 cYRSYqP15TSYZsp6oSQQvYJgRCOMV9ByiCElgbFd4927X3VAag+HRpkxQ+4Mz2i0D9
	 esvKqqdHF/IlA==
Message-ID: <5d8d4fa6-66ef-48c1-b13a-607a70e476f4@kernel.org>
Date: Thu, 30 Jan 2025 11:30:43 +0900
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 14/14] ahci: sata_rcar: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Niklas Cassel <cassel@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
 <20250127-pm_ata-v1-14-f8f50c821a2a@gmail.com>
 <CAMuHMdWdXNB=ijpWHWY5HgwJw8yw4jk9Bnmez-8MLzGRCQrXdg@mail.gmail.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <CAMuHMdWdXNB=ijpWHWY5HgwJw8yw4jk9Bnmez-8MLzGRCQrXdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/27/25 22:45, Geert Uytterhoeven wrote:
> Hi Raphael,
> 
> On Mon, 27 Jan 2025 at 13:46, Raphael Gallais-Pou <rgallaispou@gmail.com> wrote:
>> Letting the compiler remove these functions when the kernel is built
>> without CONFIG_PM_SLEEP support is simpler and less error prone than the
>> use of #ifdef based kernel configuration guards.
>>
>> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> 
> Thanks for your patch!
> 
> The subsystem prefix is "ata", not "ahci" (not all ATA-drivers are
> AHCI-drivers).

Yep. The convention is:

ata: driver_name: xxx

So it would be:

ata: sata_rcar: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()

for this patch. And the same comment applies to all your other patches in the
series.

> 
>> --- a/drivers/ata/sata_rcar.c
>> +++ b/drivers/ata/sata_rcar.c
>> @@ -927,7 +927,6 @@ static void sata_rcar_remove(struct platform_device *pdev)
>>         pm_runtime_disable(&pdev->dev);
>>  }
>>
>> -#ifdef CONFIG_PM_SLEEP
>>  static int sata_rcar_suspend(struct device *dev)
>>  {
>>         struct ata_host *host = dev_get_drvdata(dev);
>> @@ -1005,7 +1004,6 @@ static const struct dev_pm_ops sata_rcar_pm_ops = {
>>         .poweroff       = sata_rcar_suspend,
>>         .restore        = sata_rcar_restore,
>>  };
>> -#endif
> 
> If CONFIG_PM_SLEEP is disabled (e.g. m68k allyesconfig):
> 
>     drivers/ata/sata_rcar.c: In function ‘sata_rcar_suspend’:
>     drivers/ata/sata_rcar.c:936:9: error: implicit declaration of
> function ‘ata_host_suspend’; did you mean ‘sata_rcar_suspend’?
> [-Werror=implicit-function-declaration]
>       936 |         ata_host_suspend(host, PMSG_SUSPEND);
>           |         ^~~~~~~~~~~~~~~~
>           |         sata_rcar_suspend
>     drivers/ata/sata_rcar.c: In function ‘sata_rcar_resume’:
>     drivers/ata/sata_rcar.c:973:9: error: implicit declaration of
> function ‘ata_host_resume’; did you mean ‘sata_rcar_resume’?
> [-Werror=implicit-function-declaration]
>       973 |         ata_host_resume(host);
>           |         ^~~~~~~~~~~~~~~
>           |         sata_rcar_resume
> 
>>
>>  static struct platform_driver sata_rcar_driver = {
>>         .probe          = sata_rcar_probe,
>> @@ -1013,9 +1011,7 @@ static struct platform_driver sata_rcar_driver = {
>>         .driver = {
>>                 .name           = DRV_NAME,
>>                 .of_match_table = sata_rcar_match,
>> -#ifdef CONFIG_PM_SLEEP
>> -               .pm             = &sata_rcar_pm_ops,
>> -#endif
>> +               .pm             = pm_sleep_ptr(&sata_rcar_pm_ops),
>>         },
>>  };
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


-- 
Damien Le Moal
Western Digital Research

