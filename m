Return-Path: <linux-renesas-soc+bounces-31574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAqAA4gU6mmVtgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 14:46:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF7945237D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 14:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C49E430097D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 12:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3823EDAA6;
	Thu, 23 Apr 2026 12:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eC09PN2i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GneipI7q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CDE3ED5DB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 12:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948126; cv=none; b=qscafHZnXFREddYesr1bYklk1JzcPC1EoXk3amC8p3F5h0h7wkV4thbdbbKNDX8T1cxVe8NbnS8kCi7hoiN890Q5VxXsXdGe07F8lq4CPY+E4HshBuJSbWjT2CA1S6q1WCs+5MO8IkIP2GLpByRv4yXI0pb5x9KxW9MoiGAmr/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948126; c=relaxed/simple;
	bh=KFmSssNsWA8OewITIm2Bsw9eL3yfUkRv5r3J8c4woog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdhByJTSd1UtAthnlsf2RmXDFnou235ewDHGuDsksUcJCb7ZWxEaRe+rdYyP56eDL3/Q/Qw0+7G+HLgBGBotD/yP+YS++kxpR0uoDRHIPSuBNHxb/X2mfJBIoN222fCwCG1nL+i+J8DRiyGn8ioxV/RdNgglwJGMwaxCOCD9D6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eC09PN2i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GneipI7q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uKvb3413444
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 12:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nPbpkNj9ABhjGDGvKynwI0Mf
	HPrmaa9hsgMYHe0+7+Y=; b=eC09PN2i24nCZriljMh8JR/1ApJQAbNzTeI0q3AJ
	ecYJiOJZrZDmKs0KMclx5mM5sSs8rMozaTP5vcHDvT6EfMr8LxW+x5nNByuVX5p7
	0uUBmLUzk6EA4s/nXj7aqxxQ1tinWuC2x1wOaVAMZq1Sa2VVoYq1weIuCjZxa3tu
	rhcKGUnyeKVxQZozsBCCOeMugfw36mfVVMH3UPQW1yW5HYB/X+81gylFHiXPKmkd
	tsh9Aj5mT3OOS8YrlxbAJ+oZ/Hnm54MGwRs0gB/1MQOxg9xz6RvZyFyFinuqNOR9
	QAshNI31RpsjkNwnbsfUoVnHp16VxLx0svestX6bUeFzVg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h6bywh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 12:42:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50edf0245b0so93914681cf.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 05:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776948123; x=1777552923; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nPbpkNj9ABhjGDGvKynwI0MfHPrmaa9hsgMYHe0+7+Y=;
        b=GneipI7qlLytdTsdPt4obyzUD/iiUY8fOVnifW4n4TSvgKVLY7UMvRR+QD6EuYoI9r
         VNoE3PtFQd71tAJ0sqzuLiu8ia+OAAR6GvVbH9smBd+br+Cjjg1UKzGagqJexnhXCvrx
         q1Y5GiZsh8MxxltKeUa8pCKXSNBUs59lAIPdU3pLEc4/zUtUd/NdxAeIZTdJ4Vyty310
         7KMeUUTKZUAr0BBSGPMmVWb/bTEIEmk4NA243IRgHiiWtqI7S/Dev5JNUGF9AxaVw/22
         9LRqPMSdcDeANwpoInUyuoXwXqXjxnH5V1pEbvn7OsHe85kjdntGgP5fOy2tnizZIwqa
         4WMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948123; x=1777552923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPbpkNj9ABhjGDGvKynwI0MfHPrmaa9hsgMYHe0+7+Y=;
        b=RrV/EsW/Y8FcPKJm9qKGxi2jA3VLHdhif6+66YQQwDPmftJ04tNThQGtVRF7oo0Dqn
         hzTyHPzqyXcPlL6u8Yc2VF+a1KOdquClRNQg6aJn/KM1RLEbUqnL/Szvhfv2s3vOxNzY
         jyN1p8QM0OSsiLumrf5EXK9CR8YWFVeMuhwRbBVP0ljSnjEtaM4YcAJB4BA036G2IMoa
         /CLOeZmc8aH6zqFgne/aZ+tM/LD3RillRaogpYiDenk5Osnd23pM5AFhMxnyUJ7rP5CP
         F8Tm+2+at/KEqjzAzYBlTdzljSj7Eb5e8zDEzCzn1DiN43CfyyhXI6IABQozOD1sTt+1
         dtJA==
X-Forwarded-Encrypted: i=1; AFNElJ+0msJ5URXhsXDsSpWjZD4Wc+JTkxP1Ue5vj4i9SY7pkFB0xE6AoYFstxYfHyxVvA7IyeMyyfKBccc1bpupynresg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ+UZcke/3FEwBta4iGwVPmpkkh7nI9IzX1Jeh5DKgYlrUPpBM
	NB3vpuG8kDwYDY4QUko2d/8bExclOnT4kkzDXGZpjuFX/8HqAhyY+cnMlxxE92XV3SZSDiPokUH
	lhxZlcUwcs47IcSvHZihbcwPqPCeWnm0+5dh19acbYo40xAtHpmOfyN3q5Ro07e2J4q52vfhPog
	==
X-Gm-Gg: AeBDiettLt7UJQriYfblLSusqVEU7LCKofoRC6a8gqqRdbOAS7fyRgps4Xwtw0Ol3/V
	6KcLphAgx6bMDl3thzJIwAllNrSqMtWk2f5i2ALJFHGnfV4RiYTR+tQ3o4ui4+6d80itCULyUZr
	7CMFQ6yyRkH6apKJZI9C/OGBNzbgE3ETRvxjeNvdzoU2gLubNNzLBVg2Xq3LS+aJ5Z5EgPdecC2
	MMKHUOmel64YUYnThxqp6qnV+Iw8SSaLLqmoxobFab1KHb/TqXrMUeCOleqX5OedYte0e2PUjHy
	cjgfwZyN8VtVxUAmoepUPFE5xCS1HQarnhRMPlPHBYhaTVQ9CZNUx/sh85arauEKTsHV3l3Vl7x
	LeSnPLBSZwrAQSAvl/F2nv84AzqGdzIuodMXR7ewLl2dHGBGxDoKE+k9P90yGglzspEoS/NqjgL
	p5oxuvmiA4CnWGXyyWW5yGxmL5vdl9m8TYNtBhPAx3jmq+AQ==
X-Received: by 2002:a05:622a:17c7:b0:50e:89e9:271c with SMTP id d75a77b69052e-50e89e92b67mr230996621cf.17.1776948122966;
        Thu, 23 Apr 2026 05:42:02 -0700 (PDT)
X-Received: by 2002:a05:622a:17c7:b0:50e:89e9:271c with SMTP id d75a77b69052e-50e89e92b67mr230995701cf.17.1776948122428;
        Thu, 23 Apr 2026 05:42:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc240sm5134146e87.23.2026.04.23.05.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:42:01 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:41:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>,
        Liu Ying <victor.liu@nxp.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 19/41] rm/rockchip: cdn-dp: remove now-redundant call
 to drm_connector_attach_encoder()
Message-ID: <lxwchrttkseoqo4e2njsyvpgingwymabvgoqh7xmwd5ysie2dv@v7t5q4qelqen>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423-drm-bridge-connector-attach_encoder-v2-19-2ae6ca69b390@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-19-2ae6ca69b390@bootlin.com>
X-Authority-Analysis: v=2.4 cv=f4Z4wuyM c=1 sm=1 tr=0 ts=69ea139c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=P-IC7800AAAA:8
 a=Gxjqsh2QC4DOxsvvGYoA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNiBTYWx0ZWRfX+qGdaBIeP0yb
 EzBsMLHLTJ5MFkx34MzNIhXxTmpFiMv0T5EfNWnqXEPmo0H74keGpKSdHCGqW8+i6zcCRMLYFYX
 S2sRqJSaQ3btkLYzgFh/tUrT7kZtRdyCudWtdL4imQR0M05YxDRzgPnkUgXGdBD12t0a2tDXwxv
 q/sk7OMVDYELQpdMN9BF/OtBW4/ffjs8L71t+Z8MR/sBMtvpaWCmDiSZfbyXDyLc58ZfroIySlH
 oJL5BfqwPEBcDK4EMqBEpkYZFXean1bylWAtptIZEd7SEE4OEOa12qKVQ8TaEcu6oPjmJKn4WOj
 fJeHsenVKvblGsn/29IlB9F6EDJAe22j+T6xIO1e+TDxzonxCvWUKMUxLG7YF/7s0ZtNdswxlSG
 GMb8HeyQ+xEwAoKIxfKyCjkFYbxSWgFG2gUuCLmY/5ayZ8cpy2C/xoHUVJBtJvfCchk9FGV/kya
 BR6XAaUVpRdJKGjCtcA==
X-Proofpoint-GUID: -Nb2Itgyws5IjJr7pu--pNFpdRyi3xQw
X-Proofpoint-ORIG-GUID: -Nb2Itgyws5IjJr7pu--pNFpdRyi3xQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230126
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,jannau.net,nxp.com,chromium.org,oss.nxp.com,pengutronix.de,crapouillou.net,collabora.com,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,nvidia.com,iscas.ac.cn,samsung.com,glider.be,bp.renesas.com,denx.de,agner.ch,iki.fi,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31574-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[78];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AAF7945237D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 11:17:13AM +0200, Luca Ceresoli wrote:
> drm_connector_attach_encoder() is now called by
> drm_bridge_connector_init().

Nit: there is a tiny typo in the subject, but it can be fixed when
applying.

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 --
>  1 file changed, 2 deletions(-)

-- 
With best wishes
Dmitry

