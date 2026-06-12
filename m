Return-Path: <linux-renesas-soc+bounces-33951-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9HhEEB9RLGpBPQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33951-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:34:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B0467BC3F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:34:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fFyj2AKo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="L/kHukEJ";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33951-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33951-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB23830D1DEE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0C93A5459;
	Fri, 12 Jun 2026 18:30:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660013A5E8F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289026; cv=none; b=cR9Nhstzr7R11WI3h5n5mGhOXa90XFLw4zhBzFZb0m6zXKw0aDujc/wQ7VeFs2a98h6SEBZRuiyf3raTdURmePVm7dMgDPxWY981wvwkWYNEwMOkw02MNX55jXf2uhn9sUnhd5VQNTYmNsEgXRJ5dr2tLqVE3GXWc8wCvulYuIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289026; c=relaxed/simple;
	bh=hLu1cwKI2bwQjArWh6mX4nFC7KW8Gok04gwgDGIykRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZdEQps9O+D4fF0lUFU8NqXs4+J+6fDu0FgeWLlxMMWVRX1oXbzKvGG6xGbuhuD1VcE3XRBTT9FEJKKUSNYI8hi1x6BrvicWdBTdatdbbCmXnAUYfjJybA5SUacIuqaphhi6nn3PEQIcbrpH+3nTcTVc5rxWL5+f7mtL3c8B/wIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fFyj2AKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/kHukEJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGVE0q047406
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49OPqlKhqHIeEAhBZzcXi+3lZ4PA+n7d2F3AhuDo47c=; b=fFyj2AKooKHoOJKA
	NJgTtdivW3JLm+klRZc4PpTlm1VQTdUOBgkHjpNv+opgjkfzFCbs/xXVHNoIb8IP
	tIY4D0YKYKra6h+5juTT/O0WTaHR67EJ8J9eZpI12fu03EjveSnXBiJXWkJnotN8
	BdHxG7ipbukle14/tTq9WSiXQCQUTi+u0CK0zUnFql52yCXNdoNswkDV6/5bc4w3
	3cUFwu5KE94MOEUlr6lGn10HTuHcGo+wfQfcqerphjxnbSWG7LPtvgR/XM5w+7vZ
	D+ZXrEgYUErJiDyl2MUJrkd4VornswnCb0xo0hjn6So7K1550uobZwDtjyCuJpC6
	oR3wgQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u440mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9156ceb551eso193276485a.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 11:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781289024; x=1781893824; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49OPqlKhqHIeEAhBZzcXi+3lZ4PA+n7d2F3AhuDo47c=;
        b=L/kHukEJez9pNilhYX3dXDygQ4lJntOREHj6i+9Sr5lfXbJoRBIIJxtUGPxa1Sv7Cq
         YFY3y5SV7PYidTkzRVG6LLA+fhaMs6rDC5v2yU0K3p40y1QO0zs5S4B1tpmxDNH5BMKC
         CK6iv+oGd1bdjRmhP1AAegxBRHAdlCeLc2/oYXhUke8++HF0XcfyWw5X38yvLiJSPcQF
         UBPflURDeQnA3DvTUTNO4BQSgnmIGtcL5u/mSXlD23sjyi87zDdFBjv7A1NbziC9llwK
         otCchmfZdwfZnJW+1O+4RL39E3EyWy3YalSxKJ+p0kLl+nLViLlxdxJ4Ca+hlxsIViRJ
         9Phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289024; x=1781893824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=49OPqlKhqHIeEAhBZzcXi+3lZ4PA+n7d2F3AhuDo47c=;
        b=CHJgDSRkUYnFyc5mcb0zzfxX58gWOy9LmE9ZmeM33qC8xk/VuJ072xj2ik8K02ljzZ
         y8vXXOk5YNFjzbhFLHb/q+W5i94+o6b42lAfXouCCrRnu9OCvk6BMIOdQdLVr6T5RUK1
         ouhEwWe31RFfwv1CuviYTnrcWMKfkOYLHvxNW17SqK3oYYs4h6CEHbqMV2s5E8+AJ+Zp
         Ow4DYsWjcqSShuu5owQouL7bRcHbZkkKaKKk6NyoYKvYHCSmLxK0pu2IE9G0GISAqJ9s
         wphssyKH0YwIAvROeZr/T/pLrpq+aLQeP4vp6z0UslgingyGSzNZEJoYUdY1tsUAlu6H
         4arQ==
X-Forwarded-Encrypted: i=1; AFNElJ/LoNSp3r2vfhsQJbz/oQ3LYInAJRVDzMEleleWHEFwx5+bs8Bzr5cLhZYl2f7ECEp67M/8Rn7MwJqWDJrP09SHWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJmNVyopiv+6hNNnT5UORYYUNKwKjPortvBUuOEue3wwhmT+v9
	Ft/F3akNUYwNvoMK4+l7rYHDn9AHPeHGBqSPbnlniLi76ySsNXsOV122hScROL6opvTV3KuMIQT
	uJbw7EVYwA6AwcYhQpMAXyw7Pli4/SWC9nIiGCmtzcAC5DhaYJASG8+be03DcSIaXqDuQsTbQig
	==
X-Gm-Gg: Acq92OF43uAf++WOzMsWHWNXiJWhmTyuFP/tLfzJLIIp7mLaAHEwgj7pOm/4KQh1rDk
	GHch1CQ0nXPpBgtgOKcN5/E4etWsZTcyp6hlo04JpMcfpVWiDCwg2JwbSVCuXCAHtSnaFff/csB
	WL2DkBBbYwdsxcmSpjISasymCGR5DetJzTMwVmJjK/ASw/GTjUPXWi4sUz2O0NZngEoaTGFxw4T
	yd1x/pJAcjsQL6ZMG41KVw6kAaTNPA1ujIge0q45Z2CqhoESKEGUy03mpdmtnNsNgsAdMxCURoW
	JpvIG+76mSruQWoRy9dGTCL8P91zGWtIHGrtr3Sdv7HKBiVsbQjFW41c09M4rAZ8YVAz3CcGbXM
	DFAkrQ2zrPNgBljvZXiWla4KaF5NBHPtqpJjcKI8ICCMPxomIGUJTGjv2trFMEjrlH3m2gat2Hw
	YDB/hQDcQp8mOuykDOHbnCiLbg+YSCMVMa/ao=
X-Received: by 2002:a05:620a:a0d2:10b0:917:fcec:cfe0 with SMTP id af79cd13be357-917fcfc208bmr80223885a.33.1781289023503;
        Fri, 12 Jun 2026 11:30:23 -0700 (PDT)
X-Received: by 2002:a05:620a:a0d2:10b0:917:fcec:cfe0 with SMTP id af79cd13be357-917fcfc208bmr80214285a.33.1781289022999;
        Fri, 12 Jun 2026 11:30:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161fefsm742173e87.8.2026.06.12.11.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:30:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 21:30:12 +0300
Subject: [PATCH v6 2/9] drm/amd/display: use drmm allocation for writeback
 connector
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-wb-drop-encoder-v6-2-9f3a54f81310@oss.qualcomm.com>
References: <20260612-wb-drop-encoder-v6-0-9f3a54f81310@oss.qualcomm.com>
In-Reply-To: <20260612-wb-drop-encoder-v6-0-9f3a54f81310@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Alex Hung <alex.hung@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1809;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hLu1cwKI2bwQjArWh6mX4nFC7KW8Gok04gwgDGIykRs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5ZOgNlx2RvH1rmncgWo3DgW+vltmevq93dm7mxf+Ev8u
 rbv61fHOhmNWRgYuRhkxRRZfApapsZsSg77sGNqPcwgViaQKQxcnAIwEbuv7P/965vCjkxfXj1Z
 UqjpR6ueWrD5vk8ixa0SSz5WMc8XTdxVdIpFd45lkOOtyH1s6ZwvigtCTzD8fhQZfGuZeX2NUCq
 jmUp84FsuuWjFjMrJO77/tTW6rmfIOl34nbv22bvT7/Dc//0o77D/+iLWy91JDV08gkb6s9lfTW
 VNm6U5rWI3x6HVK/ReKMvapE1RNnNg+CSurmvqGlGnONeQZa6/z4+jq6umiH9n4PvAu5/3Q8KN1
 W9MOYN1eZLy/2icMarpbZNht9+lvoApLGfRMod9v/TO1drvk6y2Cj3qeNzSJHICi9vs7BbRTRoF
 aZuU0ta+m+y9gUWj4lbMr8edy14G3DWIM5qz+Ob2RttTAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: covCZsQNwCaDT5Su9NNPns7hKdVGmzTl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfXxeyM65AT6NBs
 FptuKEDEyTCyo3UL6o7J44AUU0lrnbVOkluf/uyq/l7Y57NKnCmhMXUgSP/zhLLwJZBOtp7aFmK
 iZhWa6utJiijfsJ5G4pEAPcpQKcHB48=
X-Proofpoint-ORIG-GUID: covCZsQNwCaDT5Su9NNPns7hKdVGmzTl
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2c5040 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=zd2uoN0lAAAA:8
 a=EUspDBNiAAAA:8 a=6a0IvY6ZUD0qJKO7u2MA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfXx6UlWZ9Vec2X
 ODWVSM2SwbEefJSMtg4aswl5Qjon/ahRMuglbiqXIZlbYAIYurqQOQhssITQPHkV7++d/xRHmuk
 J31FVsBPtyuXj3deseEFO45VTam0cJp5jGnOKCSpumkheWVDWmhgJFyHbLWSwvZCsEtUEE7zcL1
 DhCZVOpbr2XuaXFlzWrRhyQqj6UwuAKZ+9UHxPa9hEarxPFXYjDyQlzDP+7WVgefo8J1UNk7Mo1
 YAyB7JyK+fFqtUF+i0XCpANnetRphRGtO2kr8kx2PS//YO5FZyitDSF7wvmv+zKtWssL0e7VC7k
 NwmYGiH5UNOGz+3OeeK9b0uuZC6Yu6Lwdbf235Y0cCAFHP/SkuhT857q1aKGlWc/dtocR9Pgeo0
 b1fV3sW+/YXxiV4fwplAwflEGwQwK66+tqb3uuSvTtmWJvwoKo46ciy4ZV6clNnAUNlA4jTeokX
 x1kZ/6nJF8KlrqbYYAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120173
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33951-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:liviu.dudau@arm.com,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:christophe.jaillet@wanadoo.fr,m:alex.hung@amd.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,arm.com,ideasonboard.com,glider.be,raspberrypi.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,wanadoo.fr,amd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,amd.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75B0467BC3F

Currently memory used for writeback connectors isn't freed on driver
unbinding, leaking the memory. Use drm_device-memory allocation
function for the writeback connector, making sure that the memory is
freed on the driver unbinding.

Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Suggested-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ece581609cf7..436562e32e63 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -91,6 +91,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_eld.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_utils.h>
 #include <drm/drm_vblank.h>
@@ -5807,7 +5808,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 		link = dc_get_link_at_index(dm->dc, i);
 
 		if (link->connector_signal == SIGNAL_TYPE_VIRTUAL) {
-			struct amdgpu_dm_wb_connector *wbcon = kzalloc_obj(*wbcon);
+			struct amdgpu_dm_wb_connector *wbcon = drmm_kzalloc_obj(adev_to_drm(adev), *wbcon);
 
 			if (!wbcon) {
 				drm_err(adev_to_drm(adev), "KMS: Failed to allocate writeback connector\n");
@@ -5816,7 +5817,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 
 			if (amdgpu_dm_wb_connector_init(dm, wbcon, i)) {
 				drm_err(adev_to_drm(adev), "KMS: Failed to initialize writeback connector\n");
-				kfree(wbcon);
+				drmm_kfree(wbcon);
 				continue;
 			}
 

-- 
2.47.3


