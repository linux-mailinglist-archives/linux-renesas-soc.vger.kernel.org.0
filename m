Return-Path: <linux-renesas-soc+bounces-32580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH40MsGOBGoVLgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 16:46:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F18953561A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 16:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AB9730344F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 14:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACD44266AE;
	Wed, 13 May 2026 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGvJTuK9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpVG04VP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881B84014AE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 14:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778683341; cv=none; b=dY2GomBBP10f55SSNZH63qvWP3sOB1P9BNXJTl2S+hseBwj/4lKrknR1abgxz/5VSRcCa2a3lhffwa5rnF5PN6y6R0XuxIA38A+PKRHEfugstNC4T2vZABZ2K5XKxaLyPQZDkE73jN/Q7rPeBBQViqmOjg90wjr2gpI/rzUMD4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778683341; c=relaxed/simple;
	bh=tGdnqMGFE29Kwir5rpTWZUKDAhFPZlJYlrh+cb+F644=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPbbG/pRFUF4AUFQYHvOvm/pekbMODWMMlmSaRHEDoaEUn/JJh7mUgJXm3hvnkxwH5zM0N74ga3lIZ+koKU2Y9BV57S+p59BQrmv5TkQIxK0qONtGMO1aW9sDPzcqDXAU8bA4BPh793lVpZoNhagFVl2WeNl9tL5DA0xhXHwfh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGvJTuK9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpVG04VP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DA9mO12339070
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 14:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rrOKSfpZ1ABLMmdFMzeEe6He
	BQksg/j7nPk9sHESuLo=; b=JGvJTuK9biK6gkW+gDhs+ITPw9y+olcCPMpNbtBI
	Szl2HhGGJMlWyNCeuOk/w7BVSqcqbJZs/JivE7vtC36la2rQs9U5J+cIQr+C740T
	gGNLY62iveIi95ece2c+uN3ZSQ2+ADqicpJudEEHLAjOstW65X/vjy/UeDDlCqV7
	3bZ9Sg/YvpMpKEV1r+FmXgg65nTwuAh8UjfYu37zz36S+7TOIYu6XeUfKlXRRJQQ
	Uqb5qChyJ+whZM2KvvTYD6tW8ed89vkFObxBvwv66ufGlUPKwTghR70+ZRmR4HfL
	LssA9xWyxVJeWlEYiPV5HCRHDYYMvVjxr+JvDhYcIcziLg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxby05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 14:42:17 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-634ce585b41so1885975137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778683337; x=1779288137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rrOKSfpZ1ABLMmdFMzeEe6HeBQksg/j7nPk9sHESuLo=;
        b=RpVG04VPz41nnMltJUJqYSAcSYSlnbZyuyG6vGl3dxdJ6UA3UPb8lcgCOe7QvrVScH
         1c8jd7VJsqYhJOcybfr3PKbuXJiFku9U8BMCyUuWs6tbXnaYtTNBKYGUVvGMxm9UwPIC
         /JHr5TDdBYwXg8j50f4LyQwSfxXVc8rbuAtA0e4T+Gnunwmseide+mYzql8wK2zlsO7S
         122nirbvp++taOjmrL6+4IHbm2G1bkvj/RU31eShpzd7WTBezvppwFvLyndcQPVWq84u
         zLCuEhFRnMT52NmKtz7Mcl9QfMzwZh8lZarMhVv7J5D2lufIpCVd2Wop9yqIy1Qm/xqS
         aR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683337; x=1779288137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrOKSfpZ1ABLMmdFMzeEe6HeBQksg/j7nPk9sHESuLo=;
        b=S31+7YlgWY1utdzwXEcjK4SSLDLoSPrJ5+PDke/A7/PdxD8Jf/tZjqp/E7MVl821Nx
         DFjoZAxZJnozy+YqYddI/+L8XEPQk30QuYyAOSMKVM/dJFYSi8EiG6U0Bw1v9A51mkeD
         osjBtgKjR+OGRrx43z8SgDm/UDpIsoLv8EbQjKbOuvds2fGf1k9RkWTvH+LRYVGGHP/0
         vN5LyIvGS/pDEP262ipIEIFw/i63SHFDoiB+K2rMqbrDeLjjf8m8X3h90VDhehKxfx7d
         5yF6abV/XitfsE15VIPWg7iV0bKqavPgLJtcR8xNoAITxHWFdvoEAqrPKIPYV8Qt+4Os
         ELCQ==
X-Forwarded-Encrypted: i=1; AFNElJ88DZbwtiu3zAjANSu871mYR0gnmRgBjSSpVRTBaMqoXfSylW3dmQsqkFqwKox15NMYFDDrrGmIhlpIPkLi5uvjOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEyv0bFBwZ2mtNN2rQe0J2ktOynPr6uPfgDWrxkB6Ac0n/08Jr
	fIANF74dFG4ZZgjCEYJ0ZTGVQ4LeoIxS610+HKRkpLoethW35zx10MgmHtnLZjTvoHV0VZNQZSI
	qMwdpyk5ArLbXnzFzRFpN34Y+OyWXm9DMknChnojuGwOGBX70cjJLNNUTDaYP0FHXCo7si0ex9Q
	==
X-Gm-Gg: Acq92OEjuppKgKdFk9Kk/YNrsXiwICcEzCh21Mm3b7KSSmXmQ1jert71iJAJC6xpZ9t
	zatt8AC8CwTnC1r91Coz9jWGdvngEPQacd/b5FnrwV9VOJLBbYzi1rMOAnLBaIC09CVqJIlmHh+
	5B2UH2yHjkkM/0IfSicbLLp+LgqG6kMARJE1shnrNK15myaDyTMjtnSU8IkjZ3aJ95ZJcTL04H4
	V8/qJ08bSw1FZnukX9P8vB66Mdd2v0s+GC0Hi38kcPFNdpfZuqMGVwTTcXj/b6rWIRwrrtIPaLg
	yIxmhV2WITkupAl07zhA/u405URPVotDXQOA/YbXGBv+78gYOwvxTFtAOHEmH9dvh+w8urvlz+J
	BwrPdEeJNSBfJhwixPyZTgcJTjgGXuHYRj6PxZXtzdpIgnsn59GiYb2l6bdqbe2/ewWEvzlwYZv
	FF9V9V8lyx9ZD4ktH5XeIZVzIluprZIsW4hzY=
X-Received: by 2002:a05:6102:304e:b0:631:26f6:701a with SMTP id ada2fe7eead31-637755ed861mr1784688137.29.1778683336758;
        Wed, 13 May 2026 07:42:16 -0700 (PDT)
X-Received: by 2002:a05:6102:304e:b0:631:26f6:701a with SMTP id ada2fe7eead31-637755ed861mr1784664137.29.1778683336077;
        Wed, 13 May 2026 07:42:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c42b0f7fsm2639513e87.17.2026.05.13.07.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:42:13 -0700 (PDT)
Date: Wed, 13 May 2026 17:42:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
Subject: Re: [PATCH v3 2/2] drm: panel: add support for the Renesas R63419
 based dual-DSI video mode Display Panels
Message-ID: <tuw3b6ow3onllt4swtksqgujnhch7w2cf6zd4bymvwqddylyyh@am2lv6b767ok>
References: <20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-0-9f61cf24aebf@linaro.org>
 <20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-2-9f61cf24aebf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-topic-sm8650-ayaneo-pocket-s2-r63419-v3-2-9f61cf24aebf@linaro.org>
X-Proofpoint-ORIG-GUID: Jsp59EFFTrOy0LyD_LS8wX7TtIiAHJbA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1MSBTYWx0ZWRfX8ghArIuaBW2p
 6yZoU6hViH96s3dSlmCObU9AT9WCiHXHIV7L+2NHoLFtByCaK+IK/AG2v/R/ka6zhOsCzv4wHij
 T74XYYUWkpR6C23cXVMAg0JAvVkTx587nkrX1rW5Kn8GDUea5uaEf7NzMlpcMTGc7RVOoIP3Kvk
 w+Zac8X7Ui6mhPK5tjpx9gEf0UjReU+nR6aMaHH03cjdMRoWE6rs1TCFq4pIzGLf6QQNPoXDsWe
 2t8JRDw+W5UaUcMzyjMm4ZeCQ5v0n3da4QV162Z+yg1F0t/8APgeDWPvm4mgdwXKyjA2ad0qL5M
 epJzSQIE2/7ggqA+j+QjZaj9nIXOSkmUCC5ieO94UnDmF4HV+ph33oFtD58OWlN8q7NjnSjbJaa
 V2zEvzYcjvgfRDsLid+J7zPcmU8MkTdkFYAFDOwXzE9+ZtSbq953SOha5QQFWrT4G900Vo19HsO
 cSjn81eck+9qnc+c8Rg==
X-Proofpoint-GUID: Jsp59EFFTrOy0LyD_LS8wX7TtIiAHJbA
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a048dc9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=UqCG9HQmAAAA:8
 a=KKAkSRfTAAAA:8 a=D019lJVASnwp9djqiF0A:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130151
X-Rspamd-Queue-Id: 3F18953561A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32580-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,lists.freedesktop.org,vger.kernel.org,outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:dkim,outlook.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 04, 2026 at 10:02:06AM +0200, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Implement support for the Renesas 63419 based dual-DSI video mode
> Display Panels found in the Ayaneo gaming handled devices.
> 
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/panel/Kconfig                |  12 +
>  drivers/gpu/drm/panel/Makefile               |   1 +
>  drivers/gpu/drm/panel/panel-renesas-r63419.c | 357 +++++++++++++++++++++++++++
>  3 files changed, 370 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index d6863b28ddc5..5404d918677f 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -755,6 +755,18 @@ config DRM_PANEL_RENESAS_R61307
>  	  This panel controller can be found in LG Optimus Vu P895 smartphone
>  	  in combination with LCD panel.
>  
> +config DRM_PANEL_RENESAS_R63419
> +	tristate "Renesas R63419 dual-DSI video mode panels"
> +	depends on OF && GPIOLIB
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for Ayaneo WT0600 and WT0630
> +	  1440x2560 60Hz dual-DSI video mode display panels with Renesas
> +	  R63419 IC.
> +
> +	  These panels are used in Ayaneo handheld gaming devices.
> +
>  config DRM_PANEL_RENESAS_R69328
>  	tristate "Renesas R69328 720x1280 DSI video mode panel"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index a4291dc3905b..b498ee9b5929 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -75,6 +75,7 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
>  obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
>  obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
>  obj-$(CONFIG_DRM_PANEL_RENESAS_R61307) += panel-renesas-r61307.o
> +obj-$(CONFIG_DRM_PANEL_RENESAS_R63419) += panel-renesas-r63419.o
>  obj-$(CONFIG_DRM_PANEL_RENESAS_R69328) += panel-renesas-r69328.o
>  obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMS581VF01) += panel-samsung-ams581vf01.o
> diff --git a/drivers/gpu/drm/panel/panel-renesas-r63419.c b/drivers/gpu/drm/panel/panel-renesas-r63419.c
> new file mode 100644
> index 000000000000..2432a238cef1
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-renesas-r63419.c
> @@ -0,0 +1,357 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * DRM driver for Renesas R63419 based dual-DSI video mode panels
> + *
> + * Copyright (c) 2025, Kancy Joe <kancy2333@outlook.com>
> + * Copyright (C) 2026 Linaro Limited
> + * Author: Neil Armstrong <neil.armstrong@linaro.org>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_connector.h>
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +struct renesas_r63419_panel {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi[2];
> +	const struct panel_desc *desc;
> +
> +	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data *vdd_supplies;
> +	struct regulator_bulk_data *vcc_supplies;
> +	enum drm_panel_orientation orientation;
> +};
> +
> +/* VDDIO/VDD Supplies */
> +static const struct regulator_bulk_data renesas_r63419_vdd_supplies[] = {
> +	{ .supply = "vddio" },
> +	{ .supply = "vdd" },
> +};
> +
> +/* VSP/VSN/VCI Supplies */
> +static const struct regulator_bulk_data renesas_r63419_vcc_supplies[] = {
> +	{ .supply = "vsp" },
> +	{ .supply = "vsn" },
> +	{ .supply = "vci" },
> +};
> +
> +struct panel_desc {
> +	const struct drm_display_mode *mode;
> +	unsigned int lanes;
> +	unsigned long mode_flags;
> +	enum mipi_dsi_pixel_format format;
> +	u16 height_mm;
> +	u16 width_mm;

Drop, use those from the drm_display_mode.

> +	const struct mipi_dsi_device_info dsi_info;
> +};
> +
> +static const struct drm_display_mode wt0600_mode = {
> +	/* Dual dsi */
> +	.clock = 2 * (720 + 100 + 8 + 40) * (2560 + 15 + 2 + 8) * 60 / 1000,
> +	.hdisplay = 2 * 720,
> +	.hsync_start = 2 * (720 + 100),
> +	.hsync_end = 2 * (720 + 100 + 8),
> +	.htotal = 2 * (720 + 100 + 8 + 40),
> +	.vdisplay = 2560,
> +	.vsync_start = 2560 + 15,
> +	.vsync_end = 2560 + 15 + 2,
> +	.vtotal = 2560 + 15 + 2 + 8,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static struct panel_desc wt0600_desc = {
> +	.lanes = 4,
> +	.width_mm = 74,
> +	.height_mm = 131,
> +	.mode = &wt0600_mode,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.dsi_info = {
> +		.type = "wt0600-2k",
> +		.channel = 0,
> +		.node = NULL,
> +	},

I'd store just the name here and create dsi_info on stack.

> +};
> +
> +static struct panel_desc wt0630_desc = {
> +	.lanes = 4,
> +	.width_mm = 78,
> +	.height_mm = 140,
> +	.mode = &wt0600_mode,  /* wt0600 only has different screen size */
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.dsi_info = {
> +		.type = "wt0630-2k",
> +		.channel = 0,
> +		.node = NULL,
> +	},
> +};
> +

[...]

> +static int renesas_r63419_get_modes(struct drm_panel *panel,
> +				    struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode;
> +	struct renesas_r63419_panel *ctx = to_renesas_r63419_panel(panel);
> +
> +	mode = drm_mode_duplicate(connector->dev, ctx->desc->mode);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	/* Update panel size */
> +	mode->width_mm = ctx->desc->width_mm;
> +	mode->height_mm = ctx->desc->height_mm;
> +
> +	drm_mode_set_name(mode);
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	drm_mode_probed_add(connector, mode);

return drm_connector_helper_get_modes_fixed().

> +
> +	return 1;
> +}
> +
> +static enum drm_panel_orientation
> +renesas_r63419_get_orientation(struct drm_panel *panel)
> +{
> +	struct renesas_r63419_panel *ctx = to_renesas_r63419_panel(panel);
> +
> +	return ctx->orientation;
> +}
> +
> +static const struct drm_panel_funcs renesas_r63419_panel_funcs = {
> +	.disable = renesas_r63419_disable,
> +	.prepare = renesas_r63419_prepare,
> +	.unprepare = renesas_r63419_unprepare,
> +	.get_modes = renesas_r63419_get_modes,
> +	.get_orientation = renesas_r63419_get_orientation,
> +};
> +
> +static int renesas_r63419_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct renesas_r63419_panel *ctx;
> +	struct device_node *dsi1_node;
> +	struct mipi_dsi_host *dsi1_host;
> +	int ret, i;
> +
> +	ctx = devm_drm_panel_alloc(dev, struct renesas_r63419_panel, panel,
> +				   &renesas_r63419_panel_funcs, DRM_MODE_CONNECTOR_DSI);
> +	if (IS_ERR(ctx))
> +		return PTR_ERR(ctx);
> +
> +	ctx->desc = of_device_get_match_data(dev);
> +	if (!ctx->desc)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Failed to get panel description\n");
> +
> +	ret = devm_regulator_bulk_get_const(&dsi->dev,
> +					    ARRAY_SIZE(renesas_r63419_vdd_supplies),
> +					    renesas_r63419_vdd_supplies, &ctx->vdd_supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = devm_regulator_bulk_get_const(&dsi->dev,
> +					    ARRAY_SIZE(renesas_r63419_vcc_supplies),
> +					    renesas_r63419_vcc_supplies, &ctx->vcc_supplies);
> +	if (ret < 0)
> +		return ret;
> +
> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ctx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
> +				     "Failed to get reset gpio\n");
> +
> +	/* Get second DSI host */
> +	dsi1_node = of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
> +	if (!dsi1_node)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Failed to get remote node for second DSI\n");
> +
> +	dsi1_host = of_find_mipi_dsi_host_by_node(dsi1_node);
> +	of_node_put(dsi1_node);
> +	if (!dsi1_host)
> +		return dev_err_probe(dev, -EPROBE_DEFER,
> +				     "Failed to find second DSI host\n");
> +
> +	/* Register the second DSI device */
> +	ctx->dsi[1] = devm_mipi_dsi_device_register_full(dev, dsi1_host,
> +							 &ctx->desc->dsi_info);

This way we are not passing the OF node for the second DSI device...

> +	if (IS_ERR(ctx->dsi[1]))
> +		return dev_err_probe(dev, PTR_ERR(ctx->dsi[1]),
> +				     "Failed to register second DSI device\n");
> +
> +	ctx->dsi[0] = dsi;
> +	mipi_dsi_set_drvdata(dsi, ctx);
> +
> +	/* Get panel orientation */
> +	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
> +	if (ret < 0 && ret != -ENODEV)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get panel orientation\n");
> +
> +	ctx->panel.prepare_prev_first = true;
> +
> +	ret = drm_panel_of_backlight(&ctx->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
> +	drm_panel_add(&ctx->panel);

devm_drm_panel_add()

> +
> +	/* Configure and attach both DSI devices */
> +	for (i = 0; i < ARRAY_SIZE(ctx->dsi); i++) {
> +		ctx->dsi[i]->lanes = ctx->desc->lanes;
> +		ctx->dsi[i]->format = ctx->desc->format;
> +		ctx->dsi[i]->mode_flags = ctx->desc->mode_flags;
> +
> +		ret = mipi_dsi_attach(ctx->dsi[i]);

devm_mipi_dsi_attach()

> +		if (ret < 0) {
> +			drm_panel_remove(&ctx->panel);
> +			return dev_err_probe(dev, ret,
> +					     "Failed to attach DSI device %d\n", i);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void renesas_r63419_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct renesas_r63419_panel *ctx = mipi_dsi_get_drvdata(dsi);
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(ctx->dsi); i++)
> +		mipi_dsi_detach(ctx->dsi[i]);
> +
> +	drm_panel_remove(&ctx->panel);
> +}
> +
> +static const struct of_device_id renesas_r63419_of_match[] = {
> +	{
> +		.compatible = "ayaneo,wt0600-2k",
> +		.data = &wt0600_desc,
> +	},
> +	{
> +		.compatible = "ayaneo,wt0630-2k",
> +		.data = &wt0630_desc,
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, renesas_r63419_of_match);
> +
> +static struct mipi_dsi_driver renesas_r63419_driver = {
> +	.probe = renesas_r63419_probe,
> +	.remove = renesas_r63419_remove,
> +	.driver = {
> +		.name = "panel-renesas-r63419",
> +		.of_match_table = renesas_r63419_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(renesas_r63419_driver);
> +
> +MODULE_AUTHOR("Kancy Joe <kancy2333@outlook.com>");
> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
> +MODULE_DESCRIPTION("DRM driver for Renesas R63419 based dual-DSI video mode panels");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

