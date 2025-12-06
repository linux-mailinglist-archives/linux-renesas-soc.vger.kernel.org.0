Return-Path: <linux-renesas-soc+bounces-25627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FCDCA9DC8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 06 Dec 2025 02:40:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE346312E2AE
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  6 Dec 2025 01:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAF472DA755;
	Sat,  6 Dec 2025 01:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aR0C4UvZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NvUrnJ4M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355FB2741BC
	for <linux-renesas-soc@vger.kernel.org>; Sat,  6 Dec 2025 01:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764984579; cv=none; b=ni7Jnh1PCUgA7Ne3oUa9xly1FbpDuaYRX0gYqsqui4PqbhIlsSLL/I7/leTlLb53ndzXQn88neiV4DCA2RyhX66ls7XU2MzWdyODon1/NHoaDGwX52LLK5mefspdFDra0+Hj09F8Urotyxku128rTchcAN1DOTxkpBMgWTCsUaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764984579; c=relaxed/simple;
	bh=SpuuqB3gCY8U4puQyo93dVG7sggojAtMr5PcQZ4msY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+pxTylH5HpyrC6ds8rXpnMYqTHXYkkHaNRMq+3ihKMJ9si5pMA+OQx/XFHSL7B0tcqRvPq+7w5ickq+uVOu9Lky3ItyAz+rxixaSzYrBFRXSSM4DxVdGX53TfLpL1mWC1amisj/4Tiwa3e+K80X5suJG4Tfy5EY6zpdd8QKo/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aR0C4UvZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NvUrnJ4M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBLjP1342313
	for <linux-renesas-soc@vger.kernel.org>; Sat, 6 Dec 2025 01:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4BYCO2jlSJysGhVZ6+r+Jne2MzWsIDfsr9d93a0qCWY=; b=aR0C4UvZXXESJK1w
	FYdS16AgU9XleZt67eDtoehrncoTbqTSpQtyGWrcEF9jXcUnR6dYaaV7YepBep3b
	LU9ZX/q0d+aB/0Uhk7sBzlPpfgm267KajI4IMehBScJpOlljZDnGUeBSBEd0x007
	dDLFJkd3iGxsm6AN79/vDK6vF8obj8XdTGfvrP2ApqQPG0jqbkFjO3xEH1d+qBgr
	/vBUaRjBl4w/rJWVg1gk9OfgwVIlQ1UiJTU3AQblCo4mHLER0D8MnCjKDvHKyTGq
	FsJG2377vXKLwZuLGrCvucVBD0Ks7FTT3Jfs+LOCbX72JtFFO7/rQMYOA3dz78B8
	8yiITA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aur9au6n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 06 Dec 2025 01:29:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bbcf3bd4c8fso1904732a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Dec 2025 17:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764984576; x=1765589376; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4BYCO2jlSJysGhVZ6+r+Jne2MzWsIDfsr9d93a0qCWY=;
        b=NvUrnJ4Mw//SOynswYNpmjSkRzlHAOuGe6eKOj8VGsXJDLI/tDvYA2aj1IWdlqcmFH
         OIH3gXv0LP4fIqP+2/mYwwrs8SYiT+Cwh8Ob6zyz5u8xmG1OMhPyFwB/6FpHDmMJ7dNN
         SZA+vU6Rc8E4DqDVdtZi+KAQyF1jqkxcABOU8n9xmCoh54Nu8MUfUSOvX+3zb7Ba4tS0
         vTtqPq972Vi1fSwS6e7k3fEKpcJnxboDMxzzfUAN7l52gpZ7PQg1v6rWDdkKtWBUh7x6
         HRo61lWtsrLcLHk5RwpKN/jiWOsbtfzNgFcjz/DF5coRpqJIJK8NP1efUHUgteB+Vt0p
         gDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764984576; x=1765589376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BYCO2jlSJysGhVZ6+r+Jne2MzWsIDfsr9d93a0qCWY=;
        b=uve8Qyv0lckYhHs8M5HIMAEZ3apFOLyh+ZQJPSjY/Jqwrn2Ldtld1fVMX5wlEGjJf3
         Hru95nMfsAcHFNIXuNZc3svpyfpnvcsb4duON+DthUkgdDSa97Q8i9ILwNCrRm321w5c
         6qUpNlE98Rn57c6OddnvsXlzEiaYvVgFT7Giqv83cYDEJdCdscN6RiZLdgZ0Fo1dF2W3
         3qvNvtglvcPaNba+r7aWj+U+lAi/EuI8tGdc2/qCXa+o9h+8k58/+4VO5cj6Rx3+PMgB
         Zwz99jlD7ikXPflAn8k6J9R/M8XboP3Sme4MYE/09vC2TXoOO0s6jG6dHrAtbRlDfyOP
         rJXA==
X-Forwarded-Encrypted: i=1; AJvYcCWRG+Rvk+bP30ZVTCQ9liXLvldAp4J0Mi4h5JoFQKnJGcS3CnRrvcj81uvSIdVulTtSbW5dS7wf+WkRX0c9V/tLhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd9kwtwHTRscuYh06SPJsR5HLIqqXTnOgJu8JLVaT20gTpHsFx
	ecM8kcBst2GF9KU37qhMRq47GdzfBpuqdwtMd+sZ5dO85VZbiZdpj4ni9kZvrkCSK48XyNa9sHA
	WVwDNWiLaHge7JNP/4CpqtUBkqZ7j77MRdYvjJZym6zu7n/MjYU9zunR04OaTHTZ7CgQ8Zp5krA
	==
X-Gm-Gg: ASbGnctnUlmiWHA5G7G1vmjGSh0XqsUM0JS7cFgX1Mnb9fj2HzBCB4DuzOS2w/XnReA
	bRBfQLzibcZoP1EimifC2d4Lxf7zgaeruZingvl9VuDwPiwgEKDLQ509uUTlZQb1M07/Z27+41W
	oO8sZudGk54Js6AUY6ipYfn1Hud3M//pCRqtRj/y2N1e3DKqrVWYFcLJKJevD21kchbJEGhLPFj
	ujZQv8xuHQK9KA7UrxG8/BC/g7YV7kuoCKczDoM7xX7SiE+n1q/t/mZIytEk4quuHkPq5bLjy9n
	y5p7JFbIc58A1tzLu69aafN8cbOTsFfjeLGvZ1zMq6aHa6hwJPuehSURYoHI6GGg91dyig3fN5+
	hDxyjwZ6Ka167Ij3GKDGr8cKshgshDPqhpjxydJyUWw==
X-Received: by 2002:a05:6a00:2303:b0:7e8:3fcb:bc44 with SMTP id d2e1a72fcca58-7e8bb06ee59mr1098705b3a.25.1764984575961;
        Fri, 05 Dec 2025 17:29:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4ghndnLUTwdPbWBg93PiHhWZqYjSRpjlaaHQl1YIklJbUj/BDHblAINfPMFltLyT7dRC5wA==
X-Received: by 2002:a05:6a00:2303:b0:7e8:3fcb:bc44 with SMTP id d2e1a72fcca58-7e8bb06ee59mr1098679b3a.25.1764984575442;
        Fri, 05 Dec 2025 17:29:35 -0800 (PST)
Received: from [192.168.29.63] ([49.43.226.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2adc5c355sm6308508b3a.33.2025.12.05.17.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 17:29:35 -0800 (PST)
Message-ID: <a9b02517-0743-4716-8ffe-e2120d9c611a@oss.qualcomm.com>
Date: Sat, 6 Dec 2025 06:59:28 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] PCI: rzg3s-host: Use pci_generic_config_write() for
 the root bus
To: Claudiu <claudiu.beznea@tuxon.dev>, bhelgaas@google.com,
        lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
        robh@kernel.org
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
        Bjorn Helgaas <helgaas@kernel.org>
References: <20251205112443.1408518-1-claudiu.beznea.uj@bp.renesas.com>
 <20251205112443.1408518-2-claudiu.beznea.uj@bp.renesas.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20251205112443.1408518-2-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69338701 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=gtzuW6mAKwlXd79hODmrug==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yC-0_ovQAAAA:8 a=VwQbUJbxAAAA:8
 a=LsleVm4LR1ejaCuuDOAA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: QrB8WplEZ372pWi8qVHmFO_PGDkiak8Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAwOSBTYWx0ZWRfX9Se0KrM/2pZm
 zvzu8zTM47GhWBw10VJRdsyCmswMFwoB7vicvwepFfhttYLqhKzusJPtzZShYDGJpVYZczNNpuB
 dmA+fJQsrZk+5Hg5JKwsbfLxIF/cu+tFjqg0O7zSvNlTCQMkX1X0OoEbENbyc2gldnE6MjDLxKF
 eJC1rh7voQ+K1C5W5hqtCocijSrvxcrfLDTih8sry6YqD5+zc/fUni79KdfytiVPaanS93cotLr
 s+DTubVW+RThGYVLPwqJPKxWCjWGu1r9xa/10Ut/UwDBo4Mj70NLH64EVgT8SgsQWZsIG7zJOSt
 sTGP5tQP9kzK0RpWrLtOYNCPMaO5E0dN0SaicLU4Xli+8V025DIjYXxDJwyG05TG5JhKm22SMp/
 PwCcPnJjEcdel7QofsmZRJiwr8AtNQ==
X-Proofpoint-ORIG-GUID: QrB8WplEZ372pWi8qVHmFO_PGDkiak8Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_09,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060009



On 12/5/2025 4:54 PM, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S host controller allows writing to read-only PCIe
> configuration registers when the RZG3S_PCI_PERM_CFG_HWINIT_EN bit is set in
> the RZG3S_PCI_PERM register. However, callers of struct pci_ops::write
> expect the semantics defined by the PCIe specification, meaning that writes
> to read-only registers must not be allowed.
>
> The previous custom struct pci_ops::write implementation for the root bus
> temporarily enabled write access before calling pci_generic_config_write().
> This breaks the expected semantics.
>
> Remove the custom implementation and simply use pci_generic_config_write().
>
> Along with this change, the updates of the PCI_PRIMARY_BUS,
> PCI_SECONDARY_BUS, and PCI_SUBORDINATE_BUS registers were moved so that
> they no longer depends on the RZG3S_PCI_PERM_CFG_HWINIT_EN bit in the
> RZG3S_PCI_PERM_CFG register, since these registers are R/W.
>
Don't you need fixes tag and back port to stable kernels, this patch 
looks like a bug fix.

- Krishna Chaitanya.
> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>   drivers/pci/controller/pcie-rzg3s-host.c | 27 ++++--------------------
>   1 file changed, 4 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index 667e6d629474..547cbe676a25 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -439,28 +439,9 @@ static void __iomem *rzg3s_pcie_root_map_bus(struct pci_bus *bus,
>   	return host->pcie + where;
>   }
>   
> -/* Serialized by 'pci_lock' */
> -static int rzg3s_pcie_root_write(struct pci_bus *bus, unsigned int devfn,
> -				 int where, int size, u32 val)
> -{
> -	struct rzg3s_pcie_host *host = bus->sysdata;
> -	int ret;
> -
> -	/* Enable access control to the CFGU */
> -	writel_relaxed(RZG3S_PCI_PERM_CFG_HWINIT_EN,
> -		       host->axi + RZG3S_PCI_PERM);
> -
> -	ret = pci_generic_config_write(bus, devfn, where, size, val);
> -
> -	/* Disable access control to the CFGU */
> -	writel_relaxed(0, host->axi + RZG3S_PCI_PERM);
> -
> -	return ret;
> -}
> -
>   static struct pci_ops rzg3s_pcie_root_ops = {
>   	.read		= pci_generic_config_read,
> -	.write		= rzg3s_pcie_root_write,
> +	.write		= pci_generic_config_write,
>   	.map_bus	= rzg3s_pcie_root_map_bus,
>   };
>   
> @@ -1065,14 +1046,14 @@ static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
>   	writel_relaxed(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00L);
>   	writel_relaxed(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00U);
>   
> +	/* Disable access control to the CFGU */
> +	writel_relaxed(0, host->axi + RZG3S_PCI_PERM);
> +
>   	/* Update bus info */
>   	writeb_relaxed(primary_bus, host->pcie + PCI_PRIMARY_BUS);
>   	writeb_relaxed(secondary_bus, host->pcie + PCI_SECONDARY_BUS);
>   	writeb_relaxed(subordinate_bus, host->pcie + PCI_SUBORDINATE_BUS);
>   
> -	/* Disable access control to the CFGU */
> -	writel_relaxed(0, host->axi + RZG3S_PCI_PERM);
> -
>   	return 0;
>   }
>   


