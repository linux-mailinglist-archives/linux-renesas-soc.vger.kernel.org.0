Return-Path: <linux-renesas-soc+bounces-31577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AwbNEQV6mmVtgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 14:49:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4E945248B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 14:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAACD300BDAC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 12:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F23BA34;
	Thu, 23 Apr 2026 12:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f4KeQ6v7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JbtvhBlB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C05B3EDAD8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 12:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948320; cv=none; b=pOPIWRQIchlY/4QhEw9VlDOkBI66XahDoWGKkpUsEviaz5qoJCf1CTPB/2+460ZrN0puS3dFIrGU8rUD2/ZzTq8j/pZTXdcqOD6OSaZ0kGnEpFNAuH1mhRUv7THz9RPjlA2LRS3+WvQjLfhzHmWPhpEujhBtOTQFDOWxKqk8U9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948320; c=relaxed/simple;
	bh=BRXUU6ztqr1lsb3f4orzbSrY/H/lvrHRoUjqXtc+p8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBh0TjTnAAz05stWfL/pSqx4vsrBWwwfJkkz+hSFUXxz65QVaxgeo2AfcVGG8/S+soWkkZJHPSKh69+F7AMWeTwNqyi9IeS+zzeOPrhau+ORVlqEk+5VUzvmPc+0xN7yrNzDonrXfF+KfiQtLbRmtk459z2TdWorDSKsh1Sbaz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f4KeQ6v7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JbtvhBlB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uH8w030030
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 12:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dRf9flM23evHV+dCjZ11/3wA
	eY0NjlVmUaCb2MHl7Rc=; b=f4KeQ6v7smM+6vkjRyPOX9wXEYAtm4U3Svh9O4LA
	F+Ut9ODMjODxPNbgXzx8vYsDdabudfLWLc0zHnFv+oEKiz89nUOO2sQPOHS/+ZM3
	zQT6oMIVkCq5Wp4R3VTgnkYwX6xePFRT1MC0rIMz32csoNRax4q/mT6Yr/+zL+9C
	7OuvYNvRF7g+TmXzCH7lNo60EkNeNnDFHwVPY44uYX+2fEK1axSGxBuE/TKbVwb/
	fm24A7Rzdi8ERqvvgbrmTj90vCgNjVgjSS7A0elPrw1hQn9gGEzfn8Ty8iz4A8An
	nqvE0T5Xjg8h9sNYtk4IJbU+TIpW+LIBNd98FbPRTRXSOQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqdjm1jnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 12:45:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-612ef4e6c54so10940961137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 05:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776948317; x=1777553117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dRf9flM23evHV+dCjZ11/3wAeY0NjlVmUaCb2MHl7Rc=;
        b=JbtvhBlBjNtksg6F/W2dD7QD6yVL48MbpjPzt3iBjceZbCdgGJuXoLcc09417f6ZkR
         IHnKY2+d4zHgiZTsu2gUvGOyg1oXjk9Ht2lr7gVabwlUgk8NY5ewW9pOxfhWZ+TUojUs
         DeYG2TzP0ULHzkPzf07OT6o9ajtpeAp4nfLsw8D0Hl5kEJCA26OqCvYKwxRA77rZor3m
         LjB8x8MwTiNdnnt3pDw2TtRi5XlcJXxLgZ7BLiGsbnLAMbdetpgQ+AdxUTDW4oh2GE/q
         wAccZNrYK6ohAaAC5kaiua/WU3loQM4R3Dzk7TLUpD4vNtcyHy5qs3KuzULOzh8umYdI
         Duvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948317; x=1777553117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRf9flM23evHV+dCjZ11/3wAeY0NjlVmUaCb2MHl7Rc=;
        b=gS+PXMH94+n92nUEpRPA+RMGckczVsPkZvGhySbQuiLcbQz2PhAoRaXzkoA0hFHiSE
         sZR46iMMBM1L9Tv/q1C8F7YxTrBe2lKBFb34KY4FBWSiULNSgJDybEtRu7vr4br/vzxb
         h41D+1lYKB5t3wLKneYf8+Qry/asOjNQtR9McIAhDe+hfbNQ5FodYJd6ZVcmlJSa+AYX
         eHzQdMPTmWblsBYLT0zv6i1w956oYoS9eDYXUkWqfA2XHUGCaNAAqQVNCYKGRO/h9Uev
         Ixm7P0+lmefSX6Oa2iCAHnCNsdnSrdeqYWgBE2W9wiAylp/XNARqq9hjftzew3SB0zRO
         4CGA==
X-Forwarded-Encrypted: i=1; AFNElJ8KJaN5liy8blbZGmLYSOsEpayKYraaBIcogpBU3MmzugzjFZuLfGCWHW8xYdACa1XyNNj4tHXtl3ASk1rhQ7sebw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNpeX5VO68zUt2L9sycBJarOHeE0r2DjH/MgwL+PcaFe30ev0U
	jdVb8DDzRoX16xgUcErJf1FedoTfEcSK5RCpIqmfNGYGQm/JiEzxHHkTGmRwaxBVxXsJZl3TL6C
	I3ecfb6dHN0Z6RevsWqZY9naEtnBrIXw0BY8DACM3PKJ1w6DoSnG3EyvXC70bXAxfihRmEEe8Sg
	==
X-Gm-Gg: AeBDieu0gzlzMdupGQHNpLrd3poY7qX++XYGq7xMbxbPQS4JOx4EZ6r71tBSdeU1OQE
	Rd5OO9WzXU9n7OJRgo4uzzBVet4Vtqxm0WJZ6CvwSqftq1+PaNpyQuXfxV8xOq71umnWUqaxRp4
	ssKxq89akLRYSdcFFNcsT8JJSiyka7tCiRg5d+aNsv2/UUI5K95PdRMeti5fy82ke8oJzhfWO/y
	Z7oWtgDKRDDiNU7/wG5mKaAv3a6vQNbK0KoAk41ovFYqXidFHdz7qkfySsbxGTgxJ7+F+pFUwzg
	M4ysU+rfS3vyvJiO8xdj/BdQ/5c2600TZHjksG7gk83Y4KENmzxgQ4LyN39taRs3PqPSAMdRLnm
	VMxM/pjRFeZhCL8UnM6DrsH/JiWL4eXGb29cnXd+XdDBJq5JZlZNZUCBHGOVZJS2A4CWtH7h7Gc
	HXqWgML00lDeNC2kjcEd0LYYphKwPsvw15a+Ziea2TCw+Kag==
X-Received: by 2002:a05:6102:3e0f:b0:605:19ce:9ccf with SMTP id ada2fe7eead31-616f58af7d9mr13838605137.13.1776948317069;
        Thu, 23 Apr 2026 05:45:17 -0700 (PDT)
X-Received: by 2002:a05:6102:3e0f:b0:605:19ce:9ccf with SMTP id ada2fe7eead31-616f58af7d9mr13838537137.13.1776948316554;
        Thu, 23 Apr 2026 05:45:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb75b033sm41855241fa.39.2026.04.23.05.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:45:15 -0700 (PDT)
Date: Thu, 23 Apr 2026 15:45:12 +0300
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
Subject: Re: [PATCH v2 00/41] drm/display: bridge-connector: attach encoder
 to the connector
Message-ID: <wanzalswb3lez6kyklprqojcnidab5fkxgu57lfka45w2rt4ic@xdatq5o7yiub>
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
X-Authority-Analysis: v=2.4 cv=EZn4hvmC c=1 sm=1 tr=0 ts=69ea145e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=SkVVgs_SJVxU13IceqMA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: -K1s_FJlLOcEebGCUR0r4Ugi0TX1tcCQ
X-Proofpoint-ORIG-GUID: -K1s_FJlLOcEebGCUR0r4Ugi0TX1tcCQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyNyBTYWx0ZWRfX+TsQhmtCkBZ7
 iq8t71Gr2vD4aLH2tVcLLSrzZoLLwYrLZXha0swZ2LNwo0GR1SPA9+s379vvyWTC5A35xGW3xhJ
 td9DDY2Y7gviRDAW6pOqi3LB3qgvlIrVbQX1P/PCwviWWNUMZLuLc8WPlGCe7Q605sq/Palx1Qj
 f85pySpWU0dCv6QkL/lg/ZDYMo90VSehXs117RZTEEMKR4olW8maVYvvV6G2tYcEd9YlJMTpBRe
 Zv91ndelWy2/5+sq+6nDWfiVl6QPXT1NCHLmRZh52RsYPgFBitPsPIaulidlUKcytL+reL1iw5z
 B+w0LtbAMfWRkXxe0RF/BPhhO09XjQm6WR6WzODM7f3slKjXg4G2aj4sTImFHPytFDQsscFrSWF
 vNk5U3wll6+NSdYPp76d2FM0KG/FWzO1Ju6tP/OsqgeJMUo4ta1Dw/hCEqUZP+u0oXAHoR+j33p
 IJO2v4y++K3XMs/+t2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230127
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,jannau.net,nxp.com,chromium.org,oss.nxp.com,pengutronix.de,crapouillou.net,collabora.com,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,rock-chips.com,sntech.de,nvidia.com,iscas.ac.cn,samsung.com,glider.be,bp.renesas.com,denx.de,agner.ch,iki.fi,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31577-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 8E4E945248B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 23, 2026 at 11:16:54AM +0200, Luca Ceresoli wrote:
> This series simplifies using the bridge-connector by removing the need to
> attach the newly created connector to the encoder.
> 
> == Series description
> 
> Currently all users of the bridge-connector must call
> drm_connector_attach_encoder() immediately after a successful
> drm_bridge_connector_init().
> 
> This is an unnecessary burden for users. Move the call to the end of
> drm_bridge_connector_init() so all callers can be simplified.
> 

I don't know which one is more correct in this situation, but let it be
R-B for the series:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Feel free to take the msm patches through drm-misc-next (A-b).

-- 
With best wishes
Dmitry

