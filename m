Return-Path: <linux-renesas-soc+bounces-25652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F73CAD31C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 13:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7816E306903E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 12:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DBE311972;
	Mon,  8 Dec 2025 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NOJ7rScp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E00B2F7444
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Dec 2025 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765197767; cv=none; b=fuJIlUGJNHj3dIL7cNcVt8Ht4z6lFOob7hFZA2/hlHDSw3gZQKtKKwb6axNHpzUhvJeYl6gw4wSFzIJtl9coYxhXYpD+VeYb3Hv024qx9dgCXls9aZ9pcv+Md9YN7LNn0JGHuYU8O0APjCdYt18yk84A9KlK8uBCF0j0fIqB6RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765197767; c=relaxed/simple;
	bh=8xIVj1oPw573xZll1w+KCySOz/zJABuXMM2i0K8zmFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=RsQAiSzPvkqY4oIrpMzkPh3UdaJ+fP4DKtnnsSjQi6ZWste4DpBjGnYG0/7q1HHogG7c7ERSSjKZ+it3SRvqSuVsoZYeZk8Ne/wCnyQpBcTQRL9WcJcLiUwQX50LNdcyul9fpk32PmSNUG5kvlbwtQXud3Mol+8zvctDI6jCfp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NOJ7rScp; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251208124243euoutp02a6b8157d8208ca90582d5da85700bfb5~-PgNpj4Ke2949329493euoutp02X
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Dec 2025 12:42:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251208124243euoutp02a6b8157d8208ca90582d5da85700bfb5~-PgNpj4Ke2949329493euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1765197763;
	bh=TeCHUK8ly3u0CI/lUzUWsXGJUfrPlFtMtRIQkLKm/zU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=NOJ7rScpu2XkuJCEzxkbY71v5K3qviYiAIeTlGuXEdATb4vaBoNoGO4jgEwNbakyO
	 Vy+3TuwK3C6BCfbxjUTpwW+UKXLGijpsWNzWu62pzn93xnzyQpNdrJDuLLEDSs0zPd
	 xD2/llIOYQP09TQ2tsV1Au/rjAdj5InkjZ38vCqQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251208124242eucas1p18ad0b3dea76a4e58723a1148e90be629~-PgNJCxmx2269822698eucas1p1t;
	Mon,  8 Dec 2025 12:42:42 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251208124241eusmtip1faee3b50a42c148b87ef1321d70f043a~-PgL5JH1s0280602806eusmtip1H;
	Mon,  8 Dec 2025 12:42:41 +0000 (GMT)
Message-ID: <2c274bd2-3bcc-4b75-9a37-9a6441bd7a50@samsung.com>
Date: Mon, 8 Dec 2025 13:42:40 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v7 2/2] remoteproc: qcom: Use of_reserved_mem_region_*
 functions for "memory-region"
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Patrice
	Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, Beleswar Padhi
	<b-padhi@ti.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251208124242eucas1p18ad0b3dea76a4e58723a1148e90be629
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251127142839eucas1p186846c6c1ea1d9e43369fbba9bb5d17c
X-EPHeader: CA
X-CMS-RootMailID: 20251127142839eucas1p186846c6c1ea1d9e43369fbba9bb5d17c
References: <20251124182751.507624-1-robh@kernel.org>
	<CGME20251127142839eucas1p186846c6c1ea1d9e43369fbba9bb5d17c@eucas1p1.samsung.com>
	<20251124182751.507624-2-robh@kernel.org>
	<674efe8d-c299-4ce9-bf6b-c1920a5393eb@samsung.com>
	<CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>

On 02.12.2025 15:15, Rob Herring wrote:
> On Thu, Nov 27, 2025 at 8:28 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 24.11.2025 19:27, Rob Herring (Arm) wrote:
>>> Use the newly added of_reserved_mem_region_to_resource() and
>>> of_reserved_mem_region_count() functions to handle "memory-region"
>>> properties.
>>>
>>> The error handling is a bit different in some cases. Often
>>> "memory-region" is optional, so failed lookup is not an error. But then
>>> an error in of_reserved_mem_lookup() is treated as an error. However,
>>> that distinction is not really important. Either the region is available
>>> and usable or it is not. So now, it is just
>>> of_reserved_mem_region_to_resource() which is checked for an error.
>>>
>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> This patch landed in today's linux-next as commit c70b9d5fdcd7
>> ("remoteproc: qcom: Use of_reserved_mem_region_* functions for
>> "memory-region""). In my tests I found that it breaks booting of
>> DragonBoard410c (arch/arm64/boot/dts/qcom/apq8016-sbc.dts) by causing
>> the NULL pointer dereference. The issue is caused by replacing
>> devm_ioremap_wc() with devm_ioremap_resource_wc(), which fails on
>> devm_request_mem_region(), see comment in the code below. It looks that
>> the error handling is somewhere broken. Here is the the kernel log:
>>
>> remoteproc remoteproc0: 4080000.remoteproc is available
>> qcom-wcnss-pil a204000.remoteproc: error -EBUSY: can't request region
>> for resource [mem 0x8e200000-0x8e7fffff]
>> remoteproc remoteproc1: a204000.remoteproc is available
>> remoteproc remoteproc1: powering up a204000.remoteproc
>> remoteproc remoteproc1: Booting fw image qcom/apq8016/wcnss.mbn, size
>> 4111376
>> Unable to handle kernel paging request at virtual address fffffffffffffff0
>> Mem abort info:
>> ...
>> Internal error: Oops: 0000000096000046 [#1]  SMP
>> Modules linked in: cpufreq_powersave qcom_wcnss_pil cpufreq_conservative
>> coresight_stm coresight_replicator coresight_tmc coresight_tpiu stm_core
>> coresight_funnel coresight_cpu_debug coresight_cti(+) adv7511 coresight
>> nfc rfkill msm snd_soc_lpass_apq8016 snd_soc_apq8016_sbc
>> snd_soc_lpass_cpu snd_soc_msm8916_analog snd_soc_msm8916_digital
>> snd_soc_qcom_common snd_soc_lpass_platform snd_soc_core qrtr ubwc_config
>> snd_compress llcc_qcom snd_pcm_dmaengine qcom_q6v5_mss snd_pcm ocmem
>> qcom_pil_info qcom_spmi_vadc qcom_camss drm_gpuvm qcom_pon rtc_pm8xxx
>> qcom_q6v5 qcom_spmi_temp_alarm venus_core qcom_vadc_common snd_timer
>> drm_exec qcom_sysmon snd qcom_common gpu_sched videobuf2_dma_sg
>> v4l2_mem2mem qcom_glink_smem v4l2_fwnode soundcore drm_dp_aux_bus
>> qmi_helpers mdt_loader v4l2_async videobuf2_memops videobuf2_v4l2
>> videodev qnoc_msm8916 videobuf2_common qcom_rng drm_display_helper mc
>> qcom_stats rpmsg_ctrl rpmsg_char display_connector ramoops socinfo
>> rmtfs_mem reed_solomon ax88796b asix usbnet phy_qcom_usb_hs ipv6 libsha1
>> CPU: 2 UID: 0 PID: 28 Comm: kworker/2:0 Tainted: G W
>> 6.18.0-rc1+ #16209 PREEMPT
>> Tainted: [W]=WARN
>> lr : __qcom_mdt_load+0x210/0x304 [mdt_loader]
>> Call trace:
>>    __pi_memcpy_generic+0x128/0x22c (P)
>>    qcom_mdt_load+0x68/0x60c [mdt_loader]
>>    wcnss_load+0x2c/0x5c [qcom_wcnss_pil]
>>    rproc_start+0x30/0x1b4
>>    rproc_boot+0x19c/0x560
>>    rproc_auto_boot_callback+0x1c/0x34
>>    request_firmware_work_func+0x4c/0x98
>>    process_one_work+0x208/0x60c
>>    worker_thread+0x244/0x388
>>    kthread+0x150/0x228
>>    ret_from_fork+0x10/0x20
>> Code: 927cec03 cb0e0021 8b0e0042 a9411c26 (a900340c)
>> ---[ end trace 0000000000000000 ]---
>>
>>
>>> ---
>>> v7:
>>>    - Split QCom to separate patch
>>> ---
>>>    drivers/remoteproc/qcom_q6v5_adsp.c | 24 ++++------
>>>    drivers/remoteproc/qcom_q6v5_mss.c  | 60 ++++++++-----------------
>>>    drivers/remoteproc/qcom_q6v5_pas.c  | 69 +++++++++++------------------
>>>    drivers/remoteproc/qcom_q6v5_wcss.c | 25 +++++------
>>>    drivers/remoteproc/qcom_wcnss.c     | 23 ++++------
>>>    5 files changed, 72 insertions(+), 129 deletions(-)
>>>
>>> ...
>>> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
>>> index 2c7e519a2254..14005fb049a2 100644
>>> --- a/drivers/remoteproc/qcom_wcnss.c
>>> +++ b/drivers/remoteproc/qcom_wcnss.c
>>> @@ -526,25 +526,20 @@ static int wcnss_request_irq(struct qcom_wcnss *wcnss,
>>>
>>>    static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
>>>    {
>>> -     struct reserved_mem *rmem = NULL;
>>> -     struct device_node *node;
>>> -
>>> -     node = of_parse_phandle(wcnss->dev->of_node, "memory-region", 0);
>>> -     if (node)
>>> -             rmem = of_reserved_mem_lookup(node);
>>> -     of_node_put(node);
>>> +     struct resource res;
>>> +     int ret;
>>>
>>> -     if (!rmem) {
>>> +     ret = of_reserved_mem_region_to_resource(wcnss->dev->of_node, 0, &res);
>>> +     if (ret) {
>>>                dev_err(wcnss->dev, "unable to resolve memory-region\n");
>>> -             return -EINVAL;
>>> +             return ret;
>>>        }
>>>
>>> -     wcnss->mem_phys = wcnss->mem_reloc = rmem->base;
>>> -     wcnss->mem_size = rmem->size;
>>> -     wcnss->mem_region = devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss->mem_size);
>>> +     wcnss->mem_phys = wcnss->mem_reloc = res.start;
>>> +     wcnss->mem_size = resource_size(&res);
>>> +     wcnss->mem_region = devm_ioremap_resource_wc(wcnss->dev, &res);
>> The above line causes the failure. After restoring it to:
>>
>> wcnss->mem_region = devm_ioremap_wc(wcnss->dev, wcnss->mem_phys, wcnss->mem_size);
>>
>> the mentioned board boots fine again. I'm not sure about other drivers,
>> if they also fail the same way as they might not be used on the tested
>> board.
> Other platforms (non-QCom) were tested also use
> devm_ioremap_resource_wc(). So something else is claiming the same
> region? Can you dump out /proc/iomem?
>
> The region is dynamically allocated, so maybe that has something to do with it.

# dmesg | grep mem
OF: reserved mem: 0x000000008e200000..0x000000008e7fffff (6144 KiB) 
nomap non-reusable wcnss
OF: reserved mem: 0x000000008dd00000..0x000000008e1fffff (5120 KiB) 
nomap non-reusable venus
OF: reserved mem: 0x000000008dc00000..0x000000008dcfffff (1024 KiB) 
nomap non-reusable mba
OF: reserved mem: 0x0000000086000000..0x00000000862fffff (3072 KiB) 
nomap non-reusable tz-apps@86000000
OF: reserved mem: 0x0000000086300000..0x00000000863fffff (1024 KiB) 
nomap non-reusable smem@86300000
OF: reserved mem: 0x0000000086400000..0x00000000864fffff (1024 KiB) 
nomap non-reusable hypervisor@86400000
OF: reserved mem: 0x0000000086500000..0x000000008667ffff (1536 KiB) 
nomap non-reusable tz@86500000
OF: reserved mem: 0x0000000086680000..0x00000000866fffff (512 KiB) nomap 
non-reusable reserved@86680000
OF: reserved mem: 0x0000000086700000..0x00000000867dffff (896 KiB) nomap 
non-reusable rmtfs@86700000
OF: reserved mem: 0x00000000867e0000..0x00000000867fffff (128 KiB) nomap 
non-reusable rfsa@867e0000
OF: reserved mem: 0x0000000086800000..0x00000000892fffff (44032 KiB) 
nomap non-reusable mpss@86800000
OF: reserved mem: 0x00000000bff00000..0x00000000bfffffff (1024 KiB) map 
non-reusable ramoops@bff00000
NUMA: Faking a node at [mem 0x0000000080000000-0x00000000bd9fffff]
NODE_DATA(0) allocated [mem 0xbd7c6800-0xbd7c943f]
   DMA      [mem 0x0000000080000000-0x00000000bd9fffff]
Early memory node ranges
   node   0: [mem 0x0000000080000000-0x0000000085ffffff]
   node   0: [mem 0x0000000086000000-0x00000000892fffff]
   node   0: [mem 0x0000000089300000-0x000000008dbfffff]
   node   0: [mem 0x000000008dc00000-0x000000008e7fffff]
   node   0: [mem 0x000000008e800000-0x00000000bd9fffff]

...


# cat /proc/iomem

...
80000000-85ffffff : System RAM
  80000000-821affff : Kernel code
  821b0000-82e5ffff : reserved
  82e60000-840fffff : Kernel data
  85000000-85013fff : reserved
86000000-892fffff : reserved
89300000-8dbfffff : System RAM
8dc00000-8e7fffff : reserved
  8dc00000-8e7fffff : reserved
8e800000-bd9fffff : System RAM
  b1000000-b6ffffff : reserved
  b7000000-bbe08fff : reserved
  bc480000-bd5fffff : reserved
  bd621000-bd623fff : reserved
  bd624000-bd724fff : reserved
  bd725000-bd7b0fff : reserved
  bd7b2000-bd7b4fff : reserved
  bd7b5000-bd7b5fff : reserved
  bd7b6000-bd7c9fff : reserved
  bd7ca000-bd9fffff : reserved


The devm_ioremap_resource_wc() requested region (0x8e200000-0x8e7fffff) 
is marked as 'reserved' in /proc/iomem.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


