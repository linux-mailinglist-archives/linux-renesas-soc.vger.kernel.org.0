Return-Path: <linux-renesas-soc+bounces-28830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Lz2JMDGqGlaxAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 00:56:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3372093B9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 00:56:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE4D43046DAF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 23:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA8338E5C7;
	Wed,  4 Mar 2026 23:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="px9zWiSd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MBTZqhE8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EA2382391
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 23:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668604; cv=none; b=T3ZV8riStiKNeKXdLz+0zergRx6etRN7G8Py2LWCgCznqABEDJOF44C9+o4Mmt/BICe4gfJfEVTfhC56qlN86fXBlHYzxYmOdcrCOqSmVf9eZX6JMwZG6MHkDXJJXAwembIh/WdUJHmKk760GnNn/uAXzozfAqvq0PH1QhOwtqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668604; c=relaxed/simple;
	bh=QDS3yl6PVsFMxaSHCd77w6eCK2g9ThZmBC8pdmHLchU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNA5m5b2sKqLGKH733H8zssuSBxLPgILnI0itCRDhgMLbjZVooKXZSP8pjEoV/NeBErGecT/w5iOBkW4GrdWDwYWkRo+s3NPwSSZMMji10ZeQKd/qUIJeySPQXOyPz37SWpuwR7W33w2sY5Y2cDXQVsf8pkue2iL/N997SP14lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=px9zWiSd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MBTZqhE8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624ILagN1213714
	for <linux-renesas-soc@vger.kernel.org>; Wed, 4 Mar 2026 23:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EbLJv2J9kPBGNa5oq1GyOOHM
	jtzn/aJKqBG/UtKmSDw=; b=px9zWiSdVRBjjzNYUaw0oeny/GHhyRKP7xnlLFdl
	mqsmRZBdQr5BS11VgzyT00uk7CDQJxVDyaOXcB9Ls3O9bOz+J7ORwzp34aFygZ/v
	W5jKE9g0yahVQ3SP76yjOwaDCM1PNzaownz+CA3mVt6CgLiJoPjGmp5zyGGhqGr0
	PhYgMs4VlqTN5f4UnIQ3o7Q9fXzAtJjh6iK1qsMZB4KAEZFOdnwggI863piJrQrt
	JNfLcwzBN1QECqgxTNiKM1wHcjr4ZymUNW5mXDQRdiyWahXteJDpr/KHIkKNvV9n
	KWdAXnCpZWuEP03yZIgWEWf+kG2eJSWvO1xktrJlxIzCGw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5tdn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 23:56:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70e610242so1335016785a.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 15:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668601; x=1773273401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EbLJv2J9kPBGNa5oq1GyOOHMjtzn/aJKqBG/UtKmSDw=;
        b=MBTZqhE81PLo9LyMPeMOK/z+nEI8xYH0tYvZOt0FOybJYggaPvBEo3MZD9aZqto7y5
         R514R2pzoiGckuiknAbFp7F6Hks+Fxp/EBzhNZSfmrkHSMeYIGBk3py30OwTmEEDY+1s
         cxXB2nlKEtufUIxraFCGfTf/2x8K9cfdUUEGpoFh2Wtt8UlwDcI9D3+OaHtLFoza3oaN
         P7yq07DfGv8WPbtB/vIaEkCxdJ1t/UNroSH03gQ6dBLcSH7pEOcJk3mj/JmlDPJ38Hv/
         I5cnKPvvZvxX9pIsq9WLZiS0YI03IPr629pIC6wxfQb2Tbgt4hwa92Fl5b5OzapcKKE/
         MZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668601; x=1773273401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbLJv2J9kPBGNa5oq1GyOOHMjtzn/aJKqBG/UtKmSDw=;
        b=auV+ADT5IBCxznohOQl0p80/9ycOs+e8FeOoyNDOqa6KwaEJKfuyd28ZojB6kKGLSd
         TUKuynTjrbxMJ/KuSZpkrw5r06peXAT1ZP2vazdTIREIAmhxq544/9tq2PxHPoQWjS27
         dxWo76CJ58Vw1IJrJz0WvVaKCjJDVwQoc4TzIfjZktCjpMOYiQwJT0lTa3WknkdXNDtQ
         LqACJfdA6MdUx93oQIqanaZn3ndH4wpRXlVby9jr0/GYrFkv2nnA5Vb5/qQrt5b7XAWf
         UNhV+Dzw9U0xrirMe3JLpImZiUF64BCBDAUwKgYDpW52dernvQiT+95pobGn6cXp1GhZ
         hlVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUz3cE/yzT7EiLjSOAFUKOp3eaRJvyqLix+EgmW/JOpUPtU1FV1DtSe7MxO15/F/2POyhiBAmRGXVSHvkUroyJgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHGz8hFso+xl95bxhox71FwQDpXbWyaD5OAX6it9OvIG8q91v7
	ijnrJPznX4vkhxUAhWE4qgcTfJKYIMY+FFWzGMd+zXgNZvbfFKbH8ISQwB0WVBxXD6/RDNoP9z2
	HcrsY0fU284OIM4q4zRrHrCkP9dyHkGSXXpc8aPcXDVkZ6NlWmCBgPK2NT0kdDMciAOiQGBcWKg
	==
X-Gm-Gg: ATEYQzxR7tiohiYcLnS7zGPdKl6yd75NwxUpf1tAx/eVZBs6sgb9AXVz8AyCO2BOAT8
	NM9hz8QHzigWa7Ntxq6RkExyK8nPAseEJf4d76jZEXKvBudsnORvsl9ROcZ1ovsqLfq1cewOrqs
	pS1EkjlZ+1IzKn5GU90fa/q+s/HHjyfAybXNRPMBDm4MDWLHw+IGScSZUyczG8I9I41NmNqC7BE
	E4jmtsYCcxZoxaOZArtgPkOby1WynVTAA2WfuIslD0ciswT5DquS7c7LWDQk5GO6DfLm0+wsHE6
	G0a5uB1mK/+QloSGcOt3gxhbZdqG9gPpyJLRnas2msldPpflgcj91Iq4MYp7KpDBWta6l5ySTBT
	x79HAWyRONJKqtdCFMY1Fv9ZUHKsdqHx+NLZX9c6ODilP70fxtdyx5X6ZEraxxOa3QhL1blu4bm
	4YRNH0zvMT7g3u81MH6s38xa9H4uZNYzLjcdw=
X-Received: by 2002:a05:620a:1a29:b0:8b1:2fab:30a8 with SMTP id af79cd13be357-8cd5afceee6mr495521585a.74.1772668601153;
        Wed, 04 Mar 2026 15:56:41 -0800 (PST)
X-Received: by 2002:a05:620a:1a29:b0:8b1:2fab:30a8 with SMTP id af79cd13be357-8cd5afceee6mr495517685a.74.1772668600503;
        Wed, 04 Mar 2026 15:56:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a125ceeafbsm1231277e87.85.2026.03.04.15.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:56:39 -0800 (PST)
Date: Thu, 5 Mar 2026 01:56:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        spacemit@lists.linux.dev, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 20/22] phy: include PHY provider header
Message-ID: <c6rtwgrwhqnkc7pomesjlmtqoj5pwsitvteolmf3t4spemysb2@rvcuyqqrj67s>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-21-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304175735.2660419-21-vladimir.oltean@nxp.com>
X-Proofpoint-GUID: OrK3dFfwMFaDfwNmW-XwggYMeOF-QCBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5OCBTYWx0ZWRfX6GkLd1pJ1sTH
 EppkCIV9R/BmKAWSbe6VYc97P9Hfg/8ZX8Src6kTHhMoMMTwHI/7O5oacbCkZDsoS6AngdSroUV
 0zUm757ipMtWKwIwB2FeXhmb1mQ92SBNxAUfmQTwuutGxHSxldjYnfranfygIEr7hN+TSWvJTaC
 CzXfYWiE+VnM08PR0/CfhstLA3Loif1mUAlpuvmMf2k2AQ0hmmr6bSw5R1Ci1lv9NhXWTSb9HZ2
 k1WKZG3cMrvq2IV788Oy66oJ9VdHQymPR++i+mBB4eXkqhVvrTvGCOKRqLAZfLU8F+uukdemQrR
 hnMjCggb0QJLTrE59s4Kal86dSTV43BFqCWZonPqNo4qvSDWlTzRoWEbbfPK1nNAEtfJx9TxCki
 TLfXhTjK4ePJzQn5iRlQ3q5fEN7rfwaQc12gB0+a4ek3r3lnRLVuaKPKJowvwe8LDvD2iVEK7f5
 W7q8tufukdhffKJECLg==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a8c6b9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=6HcPSIi93OwE2-2V8-kA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: OrK3dFfwMFaDfwNmW-XwggYMeOF-QCBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040198
X-Rspamd-Queue-Id: 0B3372093B9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28830-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:email,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 07:57:33PM +0200, Vladimir Oltean wrote:
> The majority of PHY drivers are PHY providers (obviously).
> 
> Some are providers *and* consumers (phy-meson-axg-mipi-dphy,
> phy-meson-axg-pcie). These are the Amlogic AXG SoCs, which split the
> physical layer into two chained PHYs: the digital layer and the analog
> layer. The DSI or PCIe controller interacts only with the digital PHY,
> presumably for simplicity.
> 
> The rest of PHY drivers which include <linux/phy/phy.h> do so because
> they call phy_set_bus_width(), a consumer function.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c                 | 3 ++-
>  drivers/phy/allwinner/phy-sun50i-usb3.c               | 3 ++-
>  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c           | 4 ++--
>  drivers/phy/allwinner/phy-sun9i-usb.c                 | 3 ++-
>  drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c         | 2 ++
>  drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c  | 3 ++-
>  drivers/phy/amlogic/phy-meson-axg-pcie.c              | 2 ++
>  drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c | 3 ++-
>  drivers/phy/amlogic/phy-meson-g12a-usb2.c             | 2 ++
>  drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c        | 3 ++-
>  drivers/phy/amlogic/phy-meson-gxl-usb2.c              | 3 ++-
>  drivers/phy/amlogic/phy-meson8-hdmi-tx.c              | 3 ++-
>  drivers/phy/amlogic/phy-meson8b-usb2.c                | 3 ++-
>  drivers/phy/apple/atc.c                               | 3 ++-
>  drivers/phy/broadcom/phy-bcm-cygnus-pcie.c            | 3 ++-
>  drivers/phy/broadcom/phy-bcm-kona-usb2.c              | 4 +++-
>  drivers/phy/broadcom/phy-bcm-ns-usb2.c                | 3 ++-
>  drivers/phy/broadcom/phy-bcm-ns-usb3.c                | 3 ++-
>  drivers/phy/broadcom/phy-bcm-ns2-pcie.c               | 3 ++-
>  drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c             | 3 ++-
>  drivers/phy/broadcom/phy-bcm-sr-pcie.c                | 3 ++-
>  drivers/phy/broadcom/phy-bcm-sr-usb.c                 | 3 ++-
>  drivers/phy/broadcom/phy-bcm63xx-usbh.c               | 3 ++-
>  drivers/phy/broadcom/phy-brcm-sata.c                  | 3 ++-
>  drivers/phy/broadcom/phy-brcm-usb.c                   | 2 +-
>  drivers/phy/cadence/cdns-dphy-rx.c                    | 3 ++-
>  drivers/phy/cadence/cdns-dphy.c                       | 4 ++--
>  drivers/phy/cadence/phy-cadence-salvo.c               | 3 ++-
>  drivers/phy/cadence/phy-cadence-sierra.c              | 3 ++-
>  drivers/phy/cadence/phy-cadence-torrent.c             | 3 ++-
>  drivers/phy/canaan/phy-k230-usb.c                     | 3 ++-
>  drivers/phy/eswin/phy-eic7700-sata.c                  | 3 ++-
>  drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c        | 3 ++-
>  drivers/phy/freescale/phy-fsl-imx8m-pcie.c            | 4 ++--
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c            | 3 ++-
>  drivers/phy/freescale/phy-fsl-imx8qm-hsio.c           | 6 +++---
>  drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c       | 3 ++-
>  drivers/phy/freescale/phy-fsl-lynx-28g.c              | 3 ++-
>  drivers/phy/hisilicon/phy-hi3660-usb3.c               | 3 ++-
>  drivers/phy/hisilicon/phy-hi3670-pcie.c               | 3 ++-
>  drivers/phy/hisilicon/phy-hi3670-usb3.c               | 3 ++-
>  drivers/phy/hisilicon/phy-hi6220-usb.c                | 3 ++-
>  drivers/phy/hisilicon/phy-hisi-inno-usb2.c            | 4 +++-
>  drivers/phy/hisilicon/phy-histb-combphy.c             | 3 ++-
>  drivers/phy/hisilicon/phy-hix5hd2-sata.c              | 3 ++-
>  drivers/phy/ingenic/phy-ingenic-usb.c                 | 3 ++-
>  drivers/phy/intel/phy-intel-keembay-emmc.c            | 3 ++-
>  drivers/phy/intel/phy-intel-keembay-usb.c             | 3 ++-
>  drivers/phy/intel/phy-intel-lgm-combo.c               | 4 ++--
>  drivers/phy/intel/phy-intel-lgm-emmc.c                | 3 ++-
>  drivers/phy/lantiq/phy-lantiq-rcu-usb2.c              | 3 ++-
>  drivers/phy/lantiq/phy-lantiq-vrx200-pcie.c           | 4 ++--
>  drivers/phy/marvell/phy-armada375-usb2.c              | 3 ++-
>  drivers/phy/marvell/phy-armada38x-comphy.c            | 3 ++-
>  drivers/phy/marvell/phy-berlin-sata.c                 | 3 ++-
>  drivers/phy/marvell/phy-berlin-usb.c                  | 3 ++-
>  drivers/phy/marvell/phy-mmp3-hsic.c                   | 3 ++-
>  drivers/phy/marvell/phy-mmp3-usb.c                    | 3 ++-
>  drivers/phy/marvell/phy-mvebu-a3700-comphy.c          | 3 ++-
>  drivers/phy/marvell/phy-mvebu-a3700-utmi.c            | 3 ++-
>  drivers/phy/marvell/phy-mvebu-cp110-comphy.c          | 3 ++-
>  drivers/phy/marvell/phy-mvebu-cp110-utmi.c            | 3 ++-
>  drivers/phy/marvell/phy-mvebu-sata.c                  | 3 ++-
>  drivers/phy/marvell/phy-pxa-28nm-hsic.c               | 3 ++-
>  drivers/phy/marvell/phy-pxa-28nm-usb2.c               | 3 ++-
>  drivers/phy/marvell/phy-pxa-usb.c                     | 3 ++-
>  drivers/phy/mediatek/phy-mtk-dp.c                     | 3 ++-
>  drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c            | 1 -
>  drivers/phy/mediatek/phy-mtk-hdmi.h                   | 3 ++-
>  drivers/phy/mediatek/phy-mtk-mipi-csi-0-5.c           | 2 +-
>  drivers/phy/mediatek/phy-mtk-mipi-dsi.h               | 3 ++-
>  drivers/phy/mediatek/phy-mtk-pcie.c                   | 2 +-
>  drivers/phy/mediatek/phy-mtk-tphy.c                   | 2 +-
>  drivers/phy/mediatek/phy-mtk-ufs.c                    | 2 +-
>  drivers/phy/mediatek/phy-mtk-xfi-tphy.c               | 2 +-
>  drivers/phy/mediatek/phy-mtk-xsphy.c                  | 2 +-
>  drivers/phy/microchip/lan966x_serdes.c                | 4 ++--
>  drivers/phy/microchip/sparx5_serdes.c                 | 2 +-
>  drivers/phy/motorola/phy-cpcap-usb.c                  | 3 ++-
>  drivers/phy/motorola/phy-mapphone-mdm6600.c           | 4 +++-
>  drivers/phy/mscc/phy-ocelot-serdes.c                  | 3 ++-
>  drivers/phy/nuvoton/phy-ma35d1-usb2.c                 | 3 ++-
>  drivers/phy/phy-airoha-pcie.c                         | 2 +-
>  drivers/phy/phy-can-transceiver.c                     | 3 ++-
>  drivers/phy/phy-core-mipi-dphy.c                      | 4 ++--
>  drivers/phy/phy-core.c                                | 2 ++
>  drivers/phy/phy-google-usb.c                          | 3 ++-
>  drivers/phy/phy-lpc18xx-usb-otg.c                     | 3 ++-
>  drivers/phy/phy-nxp-ptn3222.c                         | 3 ++-
>  drivers/phy/phy-pistachio-usb.c                       | 4 ++--
>  drivers/phy/phy-snps-eusb2.c                          | 2 ++
>  drivers/phy/phy-xgene.c                               | 3 ++-
>  drivers/phy/qualcomm/phy-ath79-usb.c                  | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-apq8064-sata.c          | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-edp.c                   | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c        | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c           | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-ipq806x-sata.c          | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c           | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c             | 2 ++
>  drivers/phy/qualcomm/phy-qcom-m31.c                   | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-pcie2.c                 | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c             | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c      | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c              | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c               | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c        | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c               | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c              | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-qusb2.c                 | 4 ++--
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c             | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c         | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c      | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-usb-hs-28nm.c           | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-usb-hs.c                | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-usb-hsic.c              | 3 ++-
>  drivers/phy/qualcomm/phy-qcom-usb-ss.c                | 3 ++-
>  drivers/phy/ralink/phy-mt7621-pci.c                   | 3 ++-
>  drivers/phy/ralink/phy-ralink-usb.c                   | 3 ++-
>  drivers/phy/realtek/phy-rtk-usb2.c                    | 3 ++-
>  drivers/phy/realtek/phy-rtk-usb3.c                    | 3 ++-
>  drivers/phy/renesas/phy-rcar-gen2.c                   | 3 ++-
>  drivers/phy/renesas/phy-rcar-gen3-pcie.c              | 3 ++-
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c              | 3 ++-
>  drivers/phy/renesas/phy-rcar-gen3-usb3.c              | 3 ++-
>  drivers/phy/renesas/phy-rzg3e-usb3.c                  | 3 ++-
>  drivers/phy/renesas/r8a779f0-ether-serdes.c           | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-dp.c                | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-dphy-rx0.c          | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-emmc.c              | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-inno-csidphy.c      | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c      | 4 ++--
>  drivers/phy/rockchip/phy-rockchip-inno-hdmi.c         | 2 ++
>  drivers/phy/rockchip/phy-rockchip-inno-usb2.c         | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-naneng-combphy.c    | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-pcie.c              | 2 +-
>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c     | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c     | 2 ++
>  drivers/phy/rockchip/phy-rockchip-snps-pcie3.c        | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-typec.c             | 4 ++--
>  drivers/phy/rockchip/phy-rockchip-usb.c               | 3 ++-
>  drivers/phy/rockchip/phy-rockchip-usbdp.c             | 2 ++
>  drivers/phy/samsung/phy-exynos-dp-video.c             | 3 ++-
>  drivers/phy/samsung/phy-exynos-mipi-video.c           | 3 ++-
>  drivers/phy/samsung/phy-exynos-pcie.c                 | 3 ++-
>  drivers/phy/samsung/phy-exynos4210-usb2.c             | 3 ++-
>  drivers/phy/samsung/phy-exynos4x12-usb2.c             | 3 ++-
>  drivers/phy/samsung/phy-exynos5-usbdrd.c              | 2 ++
>  drivers/phy/samsung/phy-exynos5250-sata.c             | 3 ++-
>  drivers/phy/samsung/phy-exynos5250-usb2.c             | 3 ++-
>  drivers/phy/samsung/phy-s5pv210-usb2.c                | 3 ++-
>  drivers/phy/samsung/phy-samsung-ufs.c                 | 2 +-
>  drivers/phy/samsung/phy-samsung-ufs.h                 | 3 ++-
>  drivers/phy/samsung/phy-samsung-usb2.c                | 2 ++
>  drivers/phy/samsung/phy-samsung-usb2.h                | 3 ++-
>  drivers/phy/socionext/phy-uniphier-ahci.c             | 3 ++-
>  drivers/phy/socionext/phy-uniphier-pcie.c             | 3 ++-
>  drivers/phy/socionext/phy-uniphier-usb2.c             | 3 ++-
>  drivers/phy/socionext/phy-uniphier-usb3hs.c           | 3 ++-
>  drivers/phy/socionext/phy-uniphier-usb3ss.c           | 3 ++-
>  drivers/phy/sophgo/phy-cv1800-usb2.c                  | 3 ++-
>  drivers/phy/spacemit/phy-k1-pcie.c                    | 4 ++--
>  drivers/phy/spacemit/phy-k1-usb2.c                    | 3 ++-
>  drivers/phy/st/phy-miphy28lp.c                        | 4 ++--
>  drivers/phy/st/phy-spear1310-miphy.c                  | 3 ++-
>  drivers/phy/st/phy-spear1340-miphy.c                  | 3 ++-
>  drivers/phy/st/phy-stih407-usb.c                      | 3 ++-
>  drivers/phy/st/phy-stm32-combophy.c                   | 3 ++-
>  drivers/phy/st/phy-stm32-usbphyc.c                    | 2 ++
>  drivers/phy/starfive/phy-jh7110-dphy-rx.c             | 3 ++-
>  drivers/phy/starfive/phy-jh7110-dphy-tx.c             | 3 ++-
>  drivers/phy/starfive/phy-jh7110-pcie.c                | 3 ++-
>  drivers/phy/starfive/phy-jh7110-usb.c                 | 3 ++-
>  drivers/phy/sunplus/phy-sunplus-usb2.c                | 3 ++-
>  drivers/phy/tegra/phy-tegra194-p2u.c                  | 3 ++-
>  drivers/phy/tegra/xusb-tegra124.c                     | 2 +-
>  drivers/phy/tegra/xusb-tegra186.c                     | 2 +-
>  drivers/phy/tegra/xusb-tegra210.c                     | 2 +-
>  drivers/phy/tegra/xusb.c                              | 2 +-
>  drivers/phy/ti/phy-am654-serdes.c                     | 3 ++-
>  drivers/phy/ti/phy-da8xx-usb.c                        | 3 ++-
>  drivers/phy/ti/phy-dm816x-usb.c                       | 3 ++-
>  drivers/phy/ti/phy-gmii-sel.c                         | 3 ++-
>  drivers/phy/ti/phy-omap-usb2.c                        | 3 ++-
>  drivers/phy/ti/phy-ti-pipe3.c                         | 3 ++-
>  drivers/phy/ti/phy-twl4030-usb.c                      | 3 ++-
>  drivers/phy/xilinx/phy-zynqmp.c                       | 4 ++--
>  include/linux/phy/phy-sun4i-usb.h                     | 2 +-
>  include/linux/phy/ulpi_phy.h                          | 2 +-
>  189 files changed, 363 insertions(+), 193 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> #phy/qualcomm


-- 
With best wishes
Dmitry

