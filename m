Return-Path: <linux-renesas-soc+bounces-26145-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA304CE546F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 18:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7049B304C931
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 28 Dec 2025 17:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7A62D7DF3;
	Sun, 28 Dec 2025 17:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fCe7uPA3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CF08gueA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F51A2D781E
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766942520; cv=none; b=fA+u1vP26FbE2Ht68KxAUX+l5flLQ6NBWKrMdXhEkR1xDvs1v/Lioo35SvhguUzGK7BIcgFgRCBX8Y/Egj4oxiLBQFqsmJ3OGmRdhieAVbqdqArNkVAou9BjoL3ldQTC8W+zzXprTI1OWrCkjvRYdaeLsCdChtEs7eg6SiMtGew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766942520; c=relaxed/simple;
	bh=90ODFHe66Nfjl7yi87n5IICLXsZ4owytXCS3KVu4EDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K+uXwQo3uEEpTQvq0laqZ7D0hDUyEtupqQdJPCiGZUvE8ndVRfAeNBWQXXK7SwtkuW6kJu30dSoNC8fLTRpwt4eLdlbd62Th39XPs/Std2DrYj0ahx8kVf/mdttHfeCuAW0yNXgs0+NAcZ54p1nLj7JMSPBS0QJ+aJ7AlxdhV8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fCe7uPA3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CF08gueA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSGejw33477133
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b9ETFH4qFVnd8+4vgMuarPmX3yRsMvDDnuUweRJUeYM=; b=fCe7uPA3Xkqmh1sr
	GK1R8fNjyEDbYn9uNvNzUBt10Mwwm4f85c+JJXolwuUPIOQQ9wOm3beWQ+mWllFz
	ReuyK8p2ew7oCfzP2vXlsqxStD0d2b8tzAuyhNfhdPOPfcirIgHYP1kgFelh20G/
	0+BLd2+5syRlaBKo0mRDyjaF3XlXNF4AE0kSnAolY9bOp+sm3VTFKO3/F9MtdoZa
	lMinfMZmaAcbPKid89XdkcDNOVuFE15xoFJTK78dj35mbMfaVfBPLphbNA0Xvglg
	1lvLpsATW1yMPf7YL2Tcs/ez1RKXEM3Zlk3ZDFaQrEup02/QVVaaomfQswGkkVM9
	vjEGyg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7u5jf09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 17:21:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a3822c06bso245860666d6.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 28 Dec 2025 09:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942517; x=1767547317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9ETFH4qFVnd8+4vgMuarPmX3yRsMvDDnuUweRJUeYM=;
        b=CF08gueALR2vkFeGjLeJz2vq0F7unP2/YFZ8hLl77GLVKrvGav/QgVISyAxv0CAOYM
         IsuvtpMBLqga7JKh4/8AOubfD3eWBh4F8aV8twpwEUCo5tlT2syqCJ0EsSimAG4DIU6O
         QOYS0quIle4BXw2BD6znvjT9Yf4sKnrlg8fAtRxON4mXSQf4O913BXELBEP9NkXerKGB
         cKhyEx+YjArCenRRDZ4LjlY/dio+yTwSxRa+o3izw1VRjqciQdPt3oR66fwwsxe/lRTC
         LSFX3E7YugCaPNMpSXjCmC6ZMZJlKDeKUGyTVDPx+GecB0kIqShPv/rlAqCmL9wf1hRG
         aHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942517; x=1767547317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b9ETFH4qFVnd8+4vgMuarPmX3yRsMvDDnuUweRJUeYM=;
        b=QoK2Jp3seZCvoyP/8r1LEZz+bO1TDtXByC2NULflADU4AhSUjppmysWaVCEfzHYIq6
         bnB+ZHraKVPXQYM74FR2hPnmOAuwkUZKy8NzhHzTW0kqidz/dfIxapl6dqWrmcVRlYU6
         6exbUFyxdqAm3Hi736y2XjXTlbGNkYom63ejl6hBvks6KhmNYi0kR2AyyVXJi4NnOtbV
         xATC45c/+L+T/IxoNu6PyGRg8stTEmfmaFXJq94mdAs/9v4inAm8EpkNMUXfjYw81hqT
         QdNzoBxinLBHgf0qNlW/K2TJm8eRAoIY6c0Gu3B8vQyhf92bPkW6z5NZzvPUlLqd+zHN
         Rglw==
X-Forwarded-Encrypted: i=1; AJvYcCUqPpBEmDoeYNnTNwNfJxnSqsJ9s96G83xPiWtTtURsN1UiMLa4w7G91y04Jkzc0ouo9hTMVu5uyGHq9ZR443z0uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCszbzN6/Gwhr49Q3CjdSgrNROtdUXuy1FoasTYKTHGAvtBrto
	eyWSY2Rkmq4nm45SB6wHO9QIcrP09NsR5a33fJhlC87SvsrjeQrVNoJ4KLd8jrtENhR3imqA0ne
	qZXDkAPQ29lBBFaDY4b+Bmz/QoMKLnJLDhlOosYC7u0sSAKDZe4OL1yHSJadiRWmesx+nE/yZKg
	==
X-Gm-Gg: AY/fxX5LWoR9y3/I3YzuQjfLxk0Ul/GhLlhAldRM2HOzW6ZOGxdOqCztl0CGOxv2jnY
	B6bqNcNmCsSYNcAqfokqKpNYhZ4bMq7+RKRY9jMeGHVUiDTtty2KNmkZZe8wV5oBAm7Cky77Fg0
	2XtYiVJ0nddssEK514d6+ZBMbVLr5vyOPn3mz6LpCQyUPQZ/QfBx6MhDx+7j59r6OqwcWRg6Qne
	vTU59jRs5L1SsbvQSqG8AILcjrdVASlP1vbEyrmJK7yRLTcZi63RK2nkwn/lN/Qc7a7VW/mXr3v
	A8a9Jsa/4tboLM0ca3sMOneyA1WzBoxAjk3C7XYGMwrKN8wlPo7L5XfJxrpvifOU5jYRW5ou6uT
	JV9iIKTD0Dr/Nn9ATgfSgeWMxsYcdhc4+5UK3UXqpiyZg+enME3IacK2oWSS/u6emWjd3Op8vo9
	pK2NfnHALiEjkoAFcKR+BM7Ek=
X-Received: by 2002:a05:6214:62e:b0:880:4eac:8689 with SMTP id 6a1803df08f44-8901a046480mr56329786d6.57.1766942516736;
        Sun, 28 Dec 2025 09:21:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGB8qEu1RTRfneqwLmQfLZtXdWTJwcJICHquzn4/JCVt3C/Ojms0Lzrm+TZNYbI+Vc4LxRkpw==
X-Received: by 2002:a05:6214:62e:b0:880:4eac:8689 with SMTP id 6a1803df08f44-8901a046480mr56329426d6.57.1766942516229;
        Sun, 28 Dec 2025 09:21:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:40 +0200
Subject: [PATCH v4 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-8-58d28e668901@oss.qualcomm.com>
References: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
In-Reply-To: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3014;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=90ODFHe66Nfjl7yi87n5IICLXsZ4owytXCS3KVu4EDE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWcj9BzTRYnVcWpH+HOdUmVZsP41SRvbgNf65
 r1tUWUIDeuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIwAKCRCLPIo+Aiko
 1aRnB/44LaHrh0nL9t+l8Vm6jhnLOGva6JBnRavBIlXxZ9z4WE23lIX3WiEyrT7KyQ8m4e+qphJ
 2shMVOTKNp4d6IxIslu0RPfEZCcVynOUm+haZoWH0fbul6FKjHsfixttxMmhSBgniCaDpLn2Brm
 uf8MWBCmTndEK8JE5W+piAGszU88bTKxCU4YYh/eOFEb+LYAvwddqnzNk+FhaK6TL7s8H2t8cFq
 Sabt4YABaMeoD9UxOrjRnVuHwPET5x8fysxDQxsl/kF3qxqjF0D/Oac/p0bhLm4UPMCacwKdezp
 mnSB6VzLqdlVyoSSju677WRGgUmJZV98vHj3hVcEValfOlVq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: OMqCTe8r-Qj743sHLfs2dHXa_vDI32Cp
X-Proofpoint-ORIG-GUID: OMqCTe8r-Qj743sHLfs2dHXa_vDI32Cp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX/kRr5BMJGWfn
 g1kK3TKJy02R+bE8k3BTY1M+AOudnqzY1n4+ZCKJGIokvVzIvaF5OJ+t/87uRWx4zdsVsnZZHIj
 buQKO4w5MglqV/i8qUoVWh49gsP4ieVhr3owy6UzV7zSMB1y5DkQFZh9bGnE4D2MfSVN2JEOJdd
 Q/8WFeHTgeptMe4Is/gE/PbQEF6QLCTGePpqSdxnwiqo8PvCMPqdKGUE2HWCWwAJzVi6rBTmWSG
 ykaZTo9WpeOzI7glF7QsZ3ue8hXbPj2XAEFArq2R2BJzQf8+HTeMDoTNkQP9rKWreK6rcKuNlj5
 XZm8aP+oFusdDQzWoyquuMkZX4XBZs+MK2YRSOg/l+/s6Vkz+7vsV5eYO9aqFQEBsb35IQQtUhX
 hqci+F+rmnfs7df2VoA9/hlU1GQmXQO2snqfbbG7+OkD5tfvBQTDYYeSHRMpoAQ5QGt8r5g8lxb
 5NmuyLdbaxidZ8npoJQ==
X-Authority-Analysis: v=2.4 cv=DptbOW/+ c=1 sm=1 tr=0 ts=69516735 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=By2WwYRBACVvdXAjiroA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280159

Rename drm_writeback_connector_init_with_encoder() to
drm_writeback_connector_init() and adapt its interface to follow
drmm_writeback_connector_init().

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 14 +++++++-------
 include/drm/drm_writeback.h     | 10 +++++-----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 1a01df91b2c5..ec2575c4c21b 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -235,7 +235,7 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 }
 
 /**
- * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
+ * drm_writeback_connector_init - Initialize a writeback connector with
  * a custom encoder
  *
  * @dev: DRM device
@@ -263,11 +263,11 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
  *
  * Returns: 0 on success, or a negative error code
  */
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-					      struct drm_writeback_connector *wb_connector,
-					      struct drm_encoder *enc,
-					      const struct drm_connector_funcs *con_funcs,
-					      const u32 *formats, int n_formats)
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 struct drm_encoder *enc,
+				 const u32 *formats, int n_formats)
 {
 	struct drm_connector *connector = &wb_connector->base;
 	int ret;
@@ -284,7 +284,7 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
+EXPORT_SYMBOL(drm_writeback_connector_init);
 
 /**
  * drm_writeback_connector_cleanup - Cleanup the writeback connector
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 879ca103320c..958466a05e60 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -137,11 +137,11 @@ drm_connector_to_writeback(struct drm_connector *connector)
 	return container_of(connector, struct drm_writeback_connector, base);
 }
 
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-				struct drm_writeback_connector *wb_connector,
-				struct drm_encoder *enc,
-				const struct drm_connector_funcs *con_funcs, const u32 *formats,
-				int n_formats);
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 struct drm_encoder *enc,
+				 const u32 *formats, int n_formats);
 
 int drmm_writeback_connector_init(struct drm_device *dev,
 				  struct drm_writeback_connector *wb_connector,

-- 
2.47.3


