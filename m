Return-Path: <linux-renesas-soc+bounces-31380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCNTMLf75GmEcwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2026 17:58:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1864248EB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2026 17:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B26A630058E3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2026 15:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3D829ACD1;
	Sun, 19 Apr 2026 15:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l5AGKxvY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brTVtXp3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F5A28726E
	for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Apr 2026 15:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776614325; cv=none; b=g5RNI6XfHhfurc1Ke5GFkGxlDlezHmkCXl3ZH9h31ycfc13EpprF2ahOTs1F3mmre7xjOjDfDDF48coFJAwU2Tw2CEGG91Bp9FYYNuacbWucF73kCv2EJ0NJFuXpT/kLjXTtznk8uVYeK6t+eYn/cpV1YPA2tTWE4ap6alS1gEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776614325; c=relaxed/simple;
	bh=7MidHIkWlZStP9DrvBRJWNIc6LFap5USRWrjJ5wyeDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdioZdMVtJ8tTR1kWRf3Ilb5Gqp4Knv3JqPlDMaWDY9HAB2QfEL8Rg9uKO/fAHsQzX0S6dv0E1ucj7Wzc4vRVZEEkTq8sygE+40hG4LFoR53Zm8obhI972j9Y3QIc8acaM+eujNBZ/Vx7E47Fc0U8PCRkd35ACJrvEbngOKMKE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l5AGKxvY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brTVtXp3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63IMoqbM3490902
	for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Apr 2026 15:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pVVzUjtYcVo9D1/wybwB7s5q
	oA7TWDEHP34W7TdGa/w=; b=l5AGKxvYZq2DqP/YuqpOwKC9QnzRafnVw6qV1EDN
	30FxoSFbOI7D5hnY/U+APqwxQWetvVK3dpMErN1fzo4PzK76qURiAAIRzhKJB3JE
	F9PedlL7qSnRgfEBeGm3cKod/sZ180nfLNhkdp5UWXXebkjkY/k4Cjsbj09i1QXV
	1hYpRPikA2/lmIJeO2RJqIjjCIGWGXF+nVcfoGpH5MVBk+N/ZTALLS/AjhUPUKhB
	V+6w+1j14fYdj1JNpqrPYC5xK/tyD+JJBrd7ezIfOjNNGUStFU1usWG5pwG74xpT
	XPSRD1n0CR1HkYgaU2xvwnJBaOUYLC9QnoQUcWdvcsiKWw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm19ftvfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Apr 2026 15:58:35 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6165ec99d1dso1907025137.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 19 Apr 2026 08:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776614315; x=1777219115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVVzUjtYcVo9D1/wybwB7s5qoA7TWDEHP34W7TdGa/w=;
        b=brTVtXp3P33voRxm2nOHzEdljckrQc3f5EHIDAs0eoZKQe/HA5cXb7gNQoEmkgWdoG
         RQ4SLff77bwnYHsmGIRbFxDnfcXoz4A3a7+FpX8Bed3NU+LMy6aP7yp6je5PXytwQCJd
         iRrRU1/tlxyZ6tYjsJE/EaQNf8EUYfDFuue3sVc7jqL4YpxTzDO4/sDlIf5dRWgvg1tk
         ihidWnwRpHKw9c6WD9z/a4X9bzwGTkyAFCRLLiU7RymPxVCGTWdviq82P3i92/94QYZX
         hhe9dB6DsHuu1PbxLyAuhjtCGM/VWftYpALPzST8A1MZdu/w76qpu8jydSEGx7GiUg7X
         TFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776614315; x=1777219115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVVzUjtYcVo9D1/wybwB7s5qoA7TWDEHP34W7TdGa/w=;
        b=PzR8JCbEt06f/7mzhkxa8DpDN+4lbYpg9ysT5Q5DRghNbC9FI+2YJhtZJLmoLQFahB
         85nikyj8il3sNZ3kH+Y6HNJ4nKJ4ecH2Zn4HHt4TADBtg5W4BTzv/uqZDsf7lcNmF0hT
         K4o5W+uRJU0uJeXYt9E+GBNBisPl7J47egtLi630TfV3WCOf/GdwHHNuO/LD8zPXUAmM
         5k5nk3Y21DdlrqJEwd2puNPtCO1RqSh9gAhlwXC38stsy3L74zjl1VE7SKgBiF8F3nh4
         dVrtqwfSn7vHi7KW+fL3X2eMYhQ3zG+JFsYz67/ozCEfnzr8h32XoqxMkX1fSUUpDj6J
         AD3A==
X-Forwarded-Encrypted: i=1; AFNElJ/VdHBJDxZzljJTLzzaFDVrvG958IxNMmf/xqIzAwmLNfQgBB04Z+rDvvWGQ/qa2ouyJ1lbJ5h9L8WgPG+RkK1I6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrOFot3c5VeP/wSRPvOWOPH/yxcDd0CArGZcM5FEqCnJrz2EfG
	/4+7bkClad8SGbl+LAIi8IlQZS6kBkF59nX7/YrSuG03qkD1i5dePm6rn1nP92sTR9Sq37YJ0+/
	/9qPVaQYhl71Ln5eEe1Cd48FJAUW6RW7nDqCJwze+t3pSSHtqNM4B9btiRXhc5zpqbBjmK6RMdA
	==
X-Gm-Gg: AeBDies0xXqSrqeHqFyc0nqi4HD1j+uJkdJIN4sINlrRpPH/CmRXuzhA57w1LPfjZ4j
	vj/kmEv4CE0/jB20nlHGmogAAf96gSyt7vVEYfgb2hBOR7CqRUzzrAb9xl8KeMRdBjhmvVIA6ZK
	gaXY8SKcBJBlEilkphpFjmhEPh2aH6NEjeTu3hRmAMIyFSSaMk/TS38lc+w4nCHc4wFVIRBwr0S
	YamJ75/QgqFmN5oGkIUL9gb56jvqkSxnly6qiQE6UaZHXJu30cMPXRYsz4CKGGP9duYttnSl+G6
	4m8oRenKY0HREVVnzhowSfdi8zrqN1e4JrWRvnCCQUSYA/M/lC8i4DQ15vCPEcmZo/2xEQLz217
	5rqIbVCpLzqAZGXcH0VpZYbmhZJEE7DFBK3dhmbswbsuUgHEnbvYUzaoqUDQUWnWTRzDjsAM/A+
	cVUUfanox2P2FCowfUzwCOt10Tr5abfpC+4YTlNZ+dYwYKaA==
X-Received: by 2002:a05:6102:419f:b0:604:f029:224c with SMTP id ada2fe7eead31-616f4d6abf2mr4579242137.8.1776614315129;
        Sun, 19 Apr 2026 08:58:35 -0700 (PDT)
X-Received: by 2002:a05:6102:419f:b0:604:f029:224c with SMTP id ada2fe7eead31-616f4d6abf2mr4579226137.8.1776614314564;
        Sun, 19 Apr 2026 08:58:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb4f54ffsm19642361fa.1.2026.04.19.08.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 08:58:33 -0700 (PDT)
Date: Sun, 19 Apr 2026 18:58:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: Re: [PATCH 3/3] drm: renesas: rz-du: Add support for RZ/G3L LVDS
 encoder
Message-ID: <td55nrjrchomtatyx5phbojvjipwh64gnlnydqame5xakviafp@ixzaju2lnkpm>
References: <20260417175235.224809-1-biju.das.jz@bp.renesas.com>
 <20260417175235.224809-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417175235.224809-4-biju.das.jz@bp.renesas.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDE3MSBTYWx0ZWRfX3+f6urCe0JQW
 Ca+fz7J4Sb2BgypPDs2csjnThpOwuRCycvyl6wAOZ7R8p4y+EsqECmKSOMgSujcUdgE2jdb0QQk
 C5uyMmYNZZd/xQjorz6MZsy8W+Mh4oDNzsvHgfMtFTGyAoqHA8PY8IRtw0sfTvDjWLA+zmwD6Ck
 14QZbF2KRK2WKU1cdDTk1zMNW+pj1/ZjgyGQU3GskhxRGDg80wGUjXqHCGYMhz6wUBg01h47poS
 917kbZ5FcPrwFF31TxnqpCn8cb2O2bGnsNuQnuLUVz+bFPH3XF6AbhkF2zLT8grW7ltaR24XQ4f
 z26BaueKPyY/NNP1GLI0Czewa6wU+TB5uayV8EuP4XtGUANDFxMhT7H/8qdtS/z7QBGx3rYttpz
 r9WIp/lf4FNTB58quzDsBXDZC2tnzmr6zKo4ik4QK6VezcvtFBBXxbccU9l819JtZvdZ/MLZwXO
 ipxxwZ85+QOI2FY0VyQ==
X-Proofpoint-ORIG-GUID: SAxz-cvC5XXeWMVxuTGSEefxRjJKZPVb
X-Proofpoint-GUID: SAxz-cvC5XXeWMVxuTGSEefxRjJKZPVb
X-Authority-Analysis: v=2.4 cv=FMorAeos c=1 sm=1 tr=0 ts=69e4fbab cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=yC-0_ovQAAAA:8
 a=6jxhfPqqJYEutQ7Ysb8A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_04,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604190171
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31380-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5E1864248EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 06:52:30PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add support for the RZ/G3L LVDS encoder driver. It operates in single-link
> mode with 4 lanes (Data) + 1 lane (Clock) and supports pixel clock rates
> from 25 to 87 MHz. The LVDS module cannot be used at the same time as
> MIPI-DSI. However, LVDS and the DSI interface share a peripheral clock and
> the MIPI_DSI_PRESET_N reset signal. Also, the MIPI_DSI_CMN_RSTB and
> MIPI_DSI_ARESET_N reset signals must be asserted before using the LVDS
> module.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
>  drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
>  drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 333 ++++++++++++++++++
>  drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.h    |  22 ++
>  .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  26 ++
>  5 files changed, 395 insertions(+)
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
> index 7f2ef7137ae5..cbfc7b6bccb8 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> @@ -26,3 +26,16 @@ config DRM_RZG2L_MIPI_DSI
>  	def_tristate DRM_RZG2L_DU
>  	depends on DRM_RZG2L_USE_MIPI_DSI
>  	select DRM_MIPI_DSI
> +
> +config DRM_RZG3L_USE_LVDS
> +	bool "RZ/G3L DU LVDS Encoder Support"
> +	depends on DRM_BRIDGE && OF
> +	default DRM_RZG2L_DU
> +	help
> +	  Enable support for the RZ/G3L Display Unit embedded LVDS encoders.
> +
> +config DRM_RZG3L_LVDS
> +	def_tristate DRM_RZG2L_DU
> +	depends on DRM_RZG3L_USE_LVDS
> +	select DRM_KMS_HELPER
> +	select DRM_PANEL
> diff --git a/drivers/gpu/drm/renesas/rz-du/Makefile b/drivers/gpu/drm/renesas/rz-du/Makefile
> index 2987900ea6b6..46decb7ac4f1 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Makefile
> +++ b/drivers/gpu/drm/renesas/rz-du/Makefile
> @@ -8,3 +8,4 @@ rzg2l-du-drm-$(CONFIG_VIDEO_RENESAS_VSP1)	+= rzg2l_du_vsp.o
>  obj-$(CONFIG_DRM_RZG2L_DU)		+= rzg2l-du-drm.o
>  
>  obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+= rzg2l_mipi_dsi.o
> +obj-$(CONFIG_DRM_RZG3L_LVDS)		+= rzg3l_lvds.o
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
> new file mode 100644
> index 000000000000..bedeedbdfada
> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
> @@ -0,0 +1,333 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RZ/G3L LVDS Encoder Driver
> + *
> + * Copyright (C) 2026 Renesas Electronics Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "rzg3l_lvds.h"
> +#include "rzg3l_lvds_regs.h"
> +
> +enum rzg3l_lvds_mode {
> +	RZG3L_LVDS_MODE_JEIDA = 0,
> +	RZG3L_LVDS_MODE_JEIDA_MIRROR = 1,
> +	RZG3L_LVDS_MODE_MODE2 = 2,
> +	RZG3L_LVDS_MODE_MODE2_MIRROR = 3,
> +	RZG3L_LVDS_MODE_VESA = 4,
> +	RZG3L_LVDS_MODE_VESA_MIRROR = 5,
> +	RZG3L_LVDS_MODE_MODE6 = 6,
> +	RZG3L_LVDS_MODE_MODE6_MIRROR = 7,
> +};
> +
> +struct rzg3l_lvds {
> +	struct device *dev;
> +	struct reset_control *prstc;
> +	struct reset_control *lvd_rstc;
> +	struct regmap *regmap;
> +
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;

Please use next_bridge from the drm_bridge struct.

> +};
> +
> +#define bridge_to_rzg3l_lvds(b) \
> +	container_of(b, struct rzg3l_lvds, bridge)
> +
> +/* -----------------------------------------------------------------------------
> + * Bridge
> + */
> +static void rzg3l_lvds_atomic_enable(struct drm_bridge *bridge,
> +				     struct drm_atomic_state *state)
> +{
> +	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
> +	const struct drm_bridge_state *bridge_state;
> +	int ret;
> +	u32 fmt;
> +
> +	/* Get the LVDS format from the bridge state. */
> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> +	if (!bridge_state) {
> +		dev_err(lvds->dev, "failed to get bridge state\n");
> +		return;
> +	}
> +
> +	switch (bridge_state->output_bus_cfg.format) {
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> +		fmt = RZG3L_LVDS_MODE_JEIDA;
> +		break;
> +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> +		fmt = RZG3L_LVDS_MODE_VESA;
> +		break;
> +	default:
> +		fmt = RZG3L_LVDS_MODE_VESA;
> +		dev_warn(lvds->dev, "Unsupported bus fmt 0x%04x\n",
> +			 bridge_state->output_bus_cfg.format);
> +		break;
> +	}
> +
> +	ret = pm_runtime_resume_and_get(lvds->dev);

If this  fails for any reason, the atomic_disable() would still be
called and it will decrement the counter, potentially undeflowing it.
Consider switching to pm_runtime_get_sync(), which suits better here.


> +	if (ret < 0) {
> +		dev_err(lvds->dev, "pm_runtime_resume_and_get error\n");
> +		return;
> +	}
> +
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_BGR, LVDS_0_PHY_CH_EN_BGR);
> +	usleep_range(20, 25);
> +
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_LDO, LVDS_0_PHY_CH_EN_LDO);
> +	usleep_range(10, 15);
> +
> +	regmap_write(lvds->regmap, LVDS_CMN, LVDS_CMN_RST_PHY0_SEL);
> +	regmap_update_bits(lvds->regmap, LVDS_0_CTL_OFFSET,
> +			   LVDS_0_CTL_FMT_SEL_MSK,
> +			   FIELD_PREP(LVDS_0_CTL_FMT_SEL_MSK, fmt));
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_IO_EN_MSK, LVDS_0_PHY_CH_IO_EN);
> +	regmap_write(lvds->regmap, LVDS_CMN,
> +		     LVDS_CMN_RST_PHY0_SEL | LVDS_CMN_PHY_RESET);
> +	usleep_range(100, 150);
> +}
> +
> +static void rzg3l_lvds_atomic_disable(struct drm_bridge *bridge,
> +				      struct drm_atomic_state *state)
> +{
> +	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
> +
> +	regmap_update_bits(lvds->regmap, LVDS_CMN, LVDS_CMN_PHY_RESET, 0);
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_IO_EN_MSK, 0);
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_LDO, 0);
> +	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
> +			   LVDS_0_PHY_CH_EN_BGR, 0);
> +
> +	pm_runtime_put(lvds->dev);
> +}
> +
> +static int rzg3l_lvds_attach(struct drm_bridge *bridge,
> +			     struct drm_encoder *encoder,
> +			     enum drm_bridge_attach_flags flags)
> +{
> +	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
> +
> +	if (!lvds->next_bridge)
> +		return 0;
> +
> +	return drm_bridge_attach(encoder, lvds->next_bridge, bridge, flags);
> +}
> +
> +static enum drm_mode_status
> +rzg3l_lvds_bridge_mode_valid(struct drm_bridge *bridge,
> +			     const struct drm_display_info *info,
> +			     const struct drm_display_mode *mode)
> +{
> +	if (mode->clock > 87000)
> +		return MODE_CLOCK_HIGH;
> +
> +	if (mode->clock < 25000)
> +		return MODE_CLOCK_LOW;
> +
> +	return MODE_OK;
> +}
> +
> +bool rzg3l_lvds_is_connected(struct drm_bridge *bridge)
> +{
> +	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
> +
> +	return !!lvds->next_bridge;
> +}
> +EXPORT_SYMBOL_GPL(rzg3l_lvds_is_connected);

How is this going to be used? I don't see the user in the patch. Please
drop the unused API.

> +
> +static const struct drm_bridge_funcs rzg3l_lvds_bridge_ops = {
> +	.attach = rzg3l_lvds_attach,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_enable = rzg3l_lvds_atomic_enable,
> +	.atomic_disable = rzg3l_lvds_atomic_disable,
> +	.mode_valid = rzg3l_lvds_bridge_mode_valid,
> +};
> +
> +/* -----------------------------------------------------------------------------
> + * Power Management
> + */
> +
> +static int rzg3l_lvds_pm_runtime_suspend(struct device *dev)
> +{
> +	struct rzg3l_lvds *lvds = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = reset_control_assert(lvds->lvd_rstc);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_assert(lvds->prstc);
> +	if (ret)
> +		goto err_deassert_lvd_rstc;
> +
> +	return 0;
> +
> +err_deassert_lvd_rstc:
> +	reset_control_deassert(lvds->lvd_rstc);
> +	return ret;
> +}
> +
> +static int rzg3l_lvds_pm_runtime_resume(struct device *dev)
> +{
> +	struct rzg3l_lvds *lvds = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = reset_control_deassert(lvds->prstc);
> +	if (ret)
> +		return ret;
> +
> +	return reset_control_deassert(lvds->lvd_rstc);
> +	if (ret)
> +		goto err_assert_prstc;
> +
> +	return 0;
> +
> +err_assert_prstc:
> +	reset_control_assert(lvds->prstc);
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops rzg3l_lvds_pm_ops = {
> +	RUNTIME_PM_OPS(rzg3l_lvds_pm_runtime_suspend,
> +		       rzg3l_lvds_pm_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +};

DEFINE_RUNTIME_DEV_PM_OPS()

> +
> +/* -----------------------------------------------------------------------------
> + * Probe & Remove
> + */
> +
> +static int rzg3l_lvds_parse_dt(struct rzg3l_lvds *lvds)
> +{
> +	struct device *dev = lvds->dev;
> +	struct drm_panel *panel;
> +	int ret;
> +
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0,
> +					  &panel, &lvds->next_bridge);
> +	if (ret)
> +		return ret;
> +
> +	if (panel) {
> +		lvds->next_bridge = devm_drm_panel_bridge_add(dev, panel);
> +		if (IS_ERR_OR_NULL(lvds->next_bridge))
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rzg3l_lvds_probe(struct platform_device *pdev)
> +{
> +	struct reset_control *rstc, *arstc;
> +	struct device *dev = &pdev->dev;
> +	struct rzg3l_lvds *lvds;
> +	int ret;
> +
> +	lvds = devm_drm_bridge_alloc(dev, struct rzg3l_lvds, bridge,
> +				     &rzg3l_lvds_bridge_ops);
> +	if (IS_ERR(lvds))
> +		return PTR_ERR(lvds);
> +
> +	lvds->dev = dev;
> +	lvds->bridge.of_node = pdev->dev.of_node;
> +
> +	lvds->regmap = syscon_node_to_regmap(dev->of_node->parent);
> +	if (IS_ERR(lvds->regmap))
> +		return PTR_ERR(lvds->regmap);
> +
> +	rstc = devm_reset_control_get_optional_exclusive(dev, "rst");
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(dev, PTR_ERR(rstc), "failed to get rst\n");
> +
> +	arstc = devm_reset_control_get_optional_exclusive(dev, "arst");
> +	if (IS_ERR(arstc))
> +		return dev_err_probe(dev, PTR_ERR(arstc),
> +				     "failed to get arst\n");
> +
> +	lvds->prstc = devm_reset_control_get_shared(dev, "prst");
> +	if (IS_ERR(lvds->prstc))
> +		return dev_err_probe(dev, PTR_ERR(lvds->prstc),
> +				     "failed to get prst\n");
> +
> +	lvds->lvd_rstc = devm_reset_control_get_shared(dev, "lvdrst");
> +	if (IS_ERR(lvds->lvd_rstc))
> +		return dev_err_probe(dev, PTR_ERR(lvds->lvd_rstc),
> +				     "failed to get core reset\n");
> +
> +	platform_set_drvdata(pdev, lvds);
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable Runtime PM\n");
> +
> +	ret = rzg3l_lvds_parse_dt(lvds);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = reset_control_assert(rstc);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = reset_control_assert(arstc);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = devm_drm_bridge_add(dev, &lvds->bridge);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to register drm bridge\n");
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id rzg3l_lvds_of_table[] = {
> +	{ .compatible = "renesas,r9a08g046-lvds" },
> +	{ /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(of, rzg3l_lvds_of_table);
> +
> +static struct platform_driver rzg3l_lvds_platform_driver = {
> +	.probe		= rzg3l_lvds_probe,
> +	.driver		= {
> +		.name	= "rzg3l-lvds",
> +		.pm	= pm_ptr(&rzg3l_lvds_pm_ops),
> +		.of_match_table = rzg3l_lvds_of_table,
> +	},
> +};
> +
> +module_platform_driver(rzg3l_lvds_platform_driver);
> +
> +MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
> +MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
> +MODULE_DESCRIPTION("Renesas RZ/G3L LVDS Encoder Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.h b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.h
> new file mode 100644
> index 000000000000..2ea3cf4e1cae
> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * RZ/G3L LVDS Encoder
> + *
> + * Copyright (C) 2026 Renesas Electronics Corporation
> + *
> + */
> +
> +#ifndef __RZG3L_LVDS_H__
> +#define __RZG3L_LVDS_H__
> +
> +struct drm_bridge;
> +
> +#if IS_ENABLED(CONFIG_DRM_RZG3L_LVDS)
> +bool rzg3l_lvds_is_connected(struct drm_bridge *bridge);
> +#else
> +static inline bool rzg3l_lvds_is_connected(struct drm_bridge *bridge)
> +{
> +	return false;
> +}
> +#endif /* CONFIG_DRM_RZG3L_LVDS */
> +#endif /* __RZG3L_LVDS_H__ */
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
> new file mode 100644
> index 000000000000..281b7648f168
> --- /dev/null
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * RZ/G3L LVDS Interface Registers Definitions
> + *
> + * Copyright (C) 2026 Renesas Electronics Corporation
> + *
> + */
> +
> +#ifndef __RZG3L_LVDS_REGS_H__
> +#define __RZG3L_LVDS_REGS_H__
> +
> +#define LVDS_CMN			0x00
> +#define LVDS_CMN_RST_PHY0_SEL		(1 << 24)
> +#define LVDS_CMN_RST_PHY0_SEL_CH0	(1 << 24)
> +#define LVDS_CMN_PHY_RESET		(1 << 0)
> +
> +#define LVDS_0_PHY_OFFSET		0x10
> +#define LVDS_0_PHY_CH_IO_EN_MSK		(0x1f)
> +#define LVDS_0_PHY_CH_IO_EN		(LVDS_0_PHY_CH_IO_EN_MSK << 0)
> +#define LVDS_0_PHY_CH_EN_BGR		BIT(8)
> +#define LVDS_0_PHY_CH_EN_LDO		BIT(9)
> +
> +#define LVDS_0_CTL_OFFSET		0x14
> +#define LVDS_0_CTL_FMT_SEL_MSK		GENMASK(23, 20)
> +
> +#endif /* __RZG3L_LVDS_REGS_H__ */
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

