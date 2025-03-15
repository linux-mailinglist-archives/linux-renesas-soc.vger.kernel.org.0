Return-Path: <linux-renesas-soc+bounces-14424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12779A632B7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Mar 2025 23:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A36B7A16C6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Mar 2025 22:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA05B19D8B7;
	Sat, 15 Mar 2025 22:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZWKsZyXU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED3F1863E
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Mar 2025 22:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742078554; cv=none; b=DMbwBJzYaSdnpocGv4dciJ4UtALADjefv0HXG3h08kwQ+F0REWOLiOhZZDSmoHRse2EwuiQOeQuK2YmCsF6j7q8KacRvc3Z4BzOAfftv6L61ThdO0so2CSW6vsYgHLZ8PJu/d4i5C61qXjiDmylEy663Z//OAxbkseAo3REzckQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742078554; c=relaxed/simple;
	bh=CyIlD4DIaQn/5o00m8GgkO1XLCvO4ezpUOH3IapZjgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WTcYAARjkxcWB2PmeTOqteeG0scqqvHd3NdXvo+EcO2bhNohiyKlS6c3hs2UEEqylv5ibWTTCGS3pGoWurlfWQyxIMnwKGUELuSBqzTR2vxin3kqIga52uS54mTWci6U3ojgSphSDeNmtQJFMry7/nTmIz422sayf0Os8DHTeiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZWKsZyXU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52FLnZZc018567
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Mar 2025 22:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a4VP+ST8zJUe4Vt7FHkhIgto
	mXUT8+RrYva/Is+uJ7k=; b=ZWKsZyXUQzeMhygtovDXQMdapuNqo/+MprZKbLEO
	h2SSGsQ6mlYc0clW2WSBQnsHN1qzd1tmqFoMgfO3yB4Y0w5NBtbxTiK/+LiJrfqz
	vsIaB/Eozm8Y/q1Rd417QKRzxM75aI5sSEagaNPVzZ8fffHm/Nkp9kVGyPs8g0n/
	HtZJzhaD0JrMvtSFqkqOFRluTlRtZXtStB/rIm81I5QFdaLXI5ZYOxs+IEdPoQBm
	2oh9i0vwnjquqP3jBw1wLb4wMkLIGO5/DIw5JoTGlYlOHWk4U2F5CXVzgdkWwPgL
	fqp9sdPsQAvw6LV1wKpcXI1guc/6/U2xDcxujrKA0IjlxA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d2ah99pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Mar 2025 22:42:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f64eb467so31195836d6.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Mar 2025 15:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742078549; x=1742683349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4VP+ST8zJUe4Vt7FHkhIgtomXUT8+RrYva/Is+uJ7k=;
        b=IUYuV7sZorgeERccv9cUu3X0uhKhS0a8VMINXtPR9aOr1eEPEyUAKibEPeSd2draCL
         YWIio4Jmp4BE49K0ZheCbrk2PJzFDgT+saNNkCn+VAe05M97zQPZwkwiLEoqsYll2fhp
         jTMTvEeyNlKC0puZGshcfTN3HarUjpYYn61Eq6xoJdKpyw8Rbd9qF5Ph/i4j1z000/nX
         ovwpldWmohGQ07FUSdIZ2bqMDsstqnbmr4OnE9bO62BmhedhN6N440eM95zNGnGF3CSa
         SCVhIYi/7rWL/DlJb/UJHBo53wuMt9aNjAVR7sZqYnhPkfwyxXHSUVjFYew4H+V9TMrz
         xbBg==
X-Gm-Message-State: AOJu0YyunhbaFhbu8/FycTrHyTIG1PT36SyIwB5EONkzWdkltW0GVDx0
	BUyhsPLPBHPCdk9O1h7fFLb1BYcHMOddM2c1adZIK8nYd4rIiIou/ZUGoTUDpzeliZ3hdwQmiLo
	+1hQehM2Q6tqohnO9k2/p38jA0IDkITwsCSto6PMfXlG9zrmtmY/rfwdNfyVabF07UMiZRw==
X-Gm-Gg: ASbGncs3INGW4gD8kL1yzG0baUtwvKb3q6My9IsxmHSQ0t/kSQfUdKtfFFySOIuMiJl
	KLy0b6ZMC42zzLDYBadl77//SYoDDWN/YvJt51uPVz8Rz4x3svgbKeL6S9mLLBY2UKByDJ6Bn9l
	Faxm05a6siUBaIw+wBIrQwsqIs5g8gUlnHQQ+nsoYwf8EspedGWRwzm3wnBaWlox/9hdjwSprB6
	SPBqyO+cPIVZWAEt2RzoRUZartTHk4JnVZczF8Z09UVRPm5e76RRlEXmuKupwM9BKi+SYmu3cJp
	fVfDaY9MuKPFVAFVhYy+3pjh7+3cwa00gFsyI14LAgANisc3D3d9aUBnFKC9nLnITZVSk/b/KUS
	tceI=
X-Received: by 2002:ad4:4eae:0:b0:6e4:4288:61a3 with SMTP id 6a1803df08f44-6eaeaa4adfemr126359906d6.18.1742078549088;
        Sat, 15 Mar 2025 15:42:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG98Oj8QM/IR/65YbmgcZO+Xpaf4lvqnTld3JQQKuBpCLyMozz4NlGGXLOmCUY0gEPhfks78w==
X-Received: by 2002:ad4:4eae:0:b0:6e4:4288:61a3 with SMTP id 6a1803df08f44-6eaeaa4adfemr126359486d6.18.1742078548569;
        Sat, 15 Mar 2025 15:42:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1dc0dfsm10665811fa.105.2025.03.15.15.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 15:42:26 -0700 (PDT)
Date: Sun, 16 Mar 2025 00:42:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RFT v2] drm/bridge: ite-it6505: make use of debugfs_init
 callback
Message-ID: <xd3purmdhn34guhconvpuvw5n7nfhkt2vg4c3pdyn6f4ksgu25@ssxzqbysngww>
References: <20250315201946.7428-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315201946.7428-2-wsa+renesas@sang-engineering.com>
X-Proofpoint-ORIG-GUID: qR5uBS5JJYXbeX4rbUabrzUSBhqgRPGt
X-Proofpoint-GUID: qR5uBS5JJYXbeX4rbUabrzUSBhqgRPGt
X-Authority-Analysis: v=2.4 cv=R7kDGcRX c=1 sm=1 tr=0 ts=67d60256 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=LDBv8-xUAAAA:8 a=pLwtzlPVTVScF5mX-VMA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_09,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503150167

On Sat, Mar 15, 2025 at 09:17:16PM +0100, Wolfram Sang wrote:
> Do not create a custom directory in debugfs-root, but use the
> debugfs_init callback to create a custom directory at the given place
> for the bridge.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Only build tested, but following the same pattern as the tested
> ti-sn65dsi86.
> 
> Changes since v1:
> * switch from 'client->debugfs' to DRM 'debugfs_init' callback
> 
>  drivers/gpu/drm/bridge/ite-it6505.c | 59 ++++++++++-------------------
>  1 file changed, 19 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 88ef76a37fe6..803bfe9954e6 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -302,7 +302,6 @@
>  #define WORD_LENGTH_18BIT 1
>  #define WORD_LENGTH_20BIT 2
>  #define WORD_LENGTH_24BIT 3
> -#define DEBUGFS_DIR_NAME "it6505-debugfs"
>  #define READ_BUFFER_SIZE 400
>  
>  /* Vendor option */
> @@ -478,7 +477,6 @@ struct it6505 {
>  	struct device *codec_dev;
>  	struct delayed_work delayed_audio;
>  	struct it6505_audio_data audio;
> -	struct dentry *debugfs;
>  
>  	/* it6505 driver hold option */
>  	bool enable_drv_hold;
> @@ -3302,21 +3300,6 @@ static const struct drm_edid *it6505_bridge_edid_read(struct drm_bridge *bridge,
>  	return drm_edid_dup(it6505->cached_edid);
>  }
>  
> -static const struct drm_bridge_funcs it6505_bridge_funcs = {
> -	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> -	.atomic_reset = drm_atomic_helper_bridge_reset,
> -	.attach = it6505_bridge_attach,
> -	.detach = it6505_bridge_detach,
> -	.mode_valid = it6505_bridge_mode_valid,
> -	.atomic_enable = it6505_bridge_atomic_enable,
> -	.atomic_disable = it6505_bridge_atomic_disable,
> -	.atomic_pre_enable = it6505_bridge_atomic_pre_enable,
> -	.atomic_post_disable = it6505_bridge_atomic_post_disable,
> -	.detect = it6505_bridge_detect,
> -	.edid_read = it6505_bridge_edid_read,
> -};
> -
>  static __maybe_unused int it6505_bridge_resume(struct device *dev)
>  {
>  	struct it6505 *it6505 = dev_get_drvdata(dev);
> @@ -3574,36 +3557,34 @@ static const struct debugfs_entries debugfs_entry[] = {
>  	{ NULL, NULL },
>  };
>  
> -static void debugfs_create_files(struct it6505 *it6505)
> +static void it6505_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
>  {
> +	struct it6505 *it6505 = bridge_to_it6505(bridge);
> +	struct dentry *debugfs = debugfs_create_dir(dev_name(it6505->dev), root);
>  	int i = 0;
>  
>  	while (debugfs_entry[i].name && debugfs_entry[i].fops) {
>  		debugfs_create_file(debugfs_entry[i].name, 0644,
> -				    it6505->debugfs, it6505,
> -				    debugfs_entry[i].fops);
> +				    debugfs, it6505, debugfs_entry[i].fops);
>  		i++;
>  	}
>  }

Ni: I'd say, it's better to move this function rather than moving
it6505_bridge_funcs. LGTM otherwise.

>  
> -static void debugfs_init(struct it6505 *it6505)
> -{
> -	struct device *dev = it6505->dev;
> -
> -	it6505->debugfs = debugfs_create_dir(DEBUGFS_DIR_NAME, NULL);
> -
> -	if (IS_ERR(it6505->debugfs)) {
> -		dev_err(dev, "failed to create debugfs root");
> -		return;
> -	}
> -
> -	debugfs_create_files(it6505);
> -}
> -
> -static void it6505_debugfs_remove(struct it6505 *it6505)
> -{
> -	debugfs_remove_recursive(it6505->debugfs);
> -}
> +static const struct drm_bridge_funcs it6505_bridge_funcs = {
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.attach = it6505_bridge_attach,
> +	.detach = it6505_bridge_detach,
> +	.mode_valid = it6505_bridge_mode_valid,
> +	.atomic_enable = it6505_bridge_atomic_enable,
> +	.atomic_disable = it6505_bridge_atomic_disable,
> +	.atomic_pre_enable = it6505_bridge_atomic_pre_enable,
> +	.atomic_post_disable = it6505_bridge_atomic_post_disable,
> +	.detect = it6505_bridge_detect,
> +	.edid_read = it6505_bridge_edid_read,
> +	.debugfs_init = it6505_debugfs_init,
> +};
>  
>  static void it6505_shutdown(struct i2c_client *client)
>  {
> @@ -3689,7 +3670,6 @@ static int it6505_i2c_probe(struct i2c_client *client)
>  		it6505_poweron(it6505);
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "it6505 device name: %s", dev_name(dev));
> -	debugfs_init(it6505);
>  	pm_runtime_enable(dev);
>  
>  	it6505->aux.name = "DP-AUX";
> @@ -3712,7 +3692,6 @@ static void it6505_i2c_remove(struct i2c_client *client)
>  
>  	drm_bridge_remove(&it6505->bridge);
>  	drm_dp_aux_unregister(&it6505->aux);
> -	it6505_debugfs_remove(it6505);
>  	it6505_poweroff(it6505);
>  	it6505_remove_edid(it6505);
>  }
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry

