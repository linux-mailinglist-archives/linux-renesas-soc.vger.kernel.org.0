Return-Path: <linux-renesas-soc+bounces-31979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLyMNio5+Wni6wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 02:26:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0BF4C552E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 02:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 721B73020EFB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 00:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D96078F26;
	Tue,  5 May 2026 00:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/BMwJAm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DaobUNtt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAA527B34E
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 00:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940758; cv=none; b=QqlAaoJCQmYW+FplEo6eYcLbL+xzfDGg51K/y3tZzJvLwI7A2JXOs++hIDvXqxlxuQcjn+BKZEC8aTXTj9awHUlHRegGxw2VN5uJwydKvYgpSP4vH8sjSgQI7vFm6UWX4yMjUW1aJ9nzRaq3am7foMEB+Sj0jO0yqJJ5o7kz3+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940758; c=relaxed/simple;
	bh=mE50BYUB/UAw+zq2VOqPPalyAMn1gAB1RtsYcBWwgx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ShobxIqLuXJ+/Xet0AhcqlQ2JBvOcfLcZFTO1qYHSLx76D1wUbPVCth4Za9kR0TMszI5hjVobuiLP7GHkG5M6V/G6NlnzixMQDmOfrc2pM7A9cIHApRxWR+C5zazipxKDQfOMlowLqeIH2i0JMmj7ykJZtO3CbdyYsiacbjJTGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/BMwJAm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DaobUNtt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644IiIi51151499
	for <linux-renesas-soc@vger.kernel.org>; Tue, 5 May 2026 00:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4rDxNdRWU+aebNlPWMdizg27R+flJppZJLNZrroSxs=; b=K/BMwJAm1EgVSC0H
	/UWzYKdQV25HgaWN1Q4EQV+EWf1k0+1xWKtDFu0zA4XvWIKudYzQPzuUMyMNQGAT
	B28V8AP0+tBOW+9QVWOsipLRjRxm3a3OOHIYdWUsjM7RrEN6icFVmBZlqz9bnUee
	SGuyVjqaJVXiVgWvpGkZjMOFORmoZCcOZGiulvf7/ucCdUjyDfC/SpaSFv0gl+Vw
	0lAH0nDaa2wXgyieqauqp379JNwrKjNkkXtDwWZQ/Fi3W10gc6+OLGx3+qDuWywT
	yuvZD8xlcTTl6hhjUq5xojyHScJ96s054cF4AlSBHDlJOk0wlG0itxB5Xyq05dcv
	e32h3g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscyashh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 00:25:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5102a9671c8so112466091cf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 17:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777940754; x=1778545554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4rDxNdRWU+aebNlPWMdizg27R+flJppZJLNZrroSxs=;
        b=DaobUNtt/u7aFeYm88NQRn0hPxGhLKLYw3Wog1CqKHuQG+Twkdy1Z1Y+Cl9oHp2MsD
         vpyDvBM1QnVI3m+tc4r6nVOg95V1hjqXSjp98LGUskSPpsYDDsevvTJgN0MTpDSaOxLw
         YfGbu+XnOIQ6UaZygVnA20bO+rZqqYaI1mRAtbl39+P9X3LH3aHAVOAModzszHM/bMe/
         gpQ78aja04rK1AfZgSiR4laSSIRj/2XGOH5/PkKitVOT3CM9cyxkZmiFxN/cQlKyZAM0
         6SZvxrjm7iPJ/NrhkqrcoyK+XHnK3LJ6zQc+ZtI60rjKepj8t15BYoMwecT6kvxbRzNp
         IkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777940754; x=1778545554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y4rDxNdRWU+aebNlPWMdizg27R+flJppZJLNZrroSxs=;
        b=tXRU5aadk4sSkpl8s/loKE5WS4Q+BTgp1Oa4bXQt7yt8PKyhCVbXTfD7l2CJTw6RHx
         ihNfbwNKdsb/EpK5wTScB7ON7d+YbQeuNv4CyGTAIrT839c+T0QBLJzXLUzuGzSEv27o
         wHp8bDI4UKIZTsNajoPC3hbUAGXUmNngnLuKaQLHp6+vUMEWf54ZkbXgwMZneoMnUQ1E
         aX8CJFUp7LmTR52rOXOc2Zz/AVSJa/W7CEBbqb4o63MRen9t/+pDBbjt1IuEEhUftVGp
         x/ebWq6BmRX3A506UU48rx/x5ZUoIvAXDubx0DfZEl+N6qkQu4DUQYaG4y2IdbqLXcPq
         eLWA==
X-Forwarded-Encrypted: i=1; AFNElJ8FguvwMO5Mt6x9AKUlqlsMFaeigVkSCXIGcWfYyFNpSMv9IX1hSrzdlVOUq+F32BrUZjvcmEaeySrwJWlqN6lbIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx/h2FL6IxaL96+P487fIBSkjL/ewfGuqYYX+lqs38+wT1PSgP
	40K2QfHkoIgJH+5B/In/6YehyWiNYGw+dsa/8eYMd99tml9HyA4ypt5qQZjXgDz+tWgsfXYMAjY
	0c0jiJ92FI17lqKZIeUmPfzRzQ2rBPdFyuPPX00PrVUqS1A9cba+Dr4QOCrPvw/U+LvM5FWI7kA
	KVGcpghQ==
X-Gm-Gg: AeBDieufkFpG8Fhe8crNRpJ3+r8Wy1lXI35VlWjv5V5jkG4crNgEMWJB53VBtj/rdSp
	hOQArf+95zhpRF6iRnmv7winLxo4hH9CSZ0tfxWbzSw9VIH57VZa0i/3pJ/nzzi/CydnsjmbYvN
	NrsesqIXZ4dW2e52xMgWs8Xvab74wK5dGS1ecUyo8TWQBxcbPhDYsPxVIFjuiPcZPhIshvA6nGL
	mfRTor826bQ+MQmGaIz7GYvwPE+C4OHYUdUBePsbKG80wsdB8rxiY1za6VmpVteI0tGqubp29dJ
	JG9TFYd+enu/rg5sWdgBe2+KJhDzyHbEOdn4YuPgotn/cs9qzC0YMZHSn5Z6pcialKPGhebW3d+
	+cTe+BHYIR1SVdK3wKGoJf1OPVAjFI8uLL3vSB5khajV73HZXgR0h97yric14cIE9DPFS8/Oths
	muepLdDe42pWlWQ4KCCNywuP8IDsO6AF4hhegpNKzSS4IZbQ==
X-Received: by 2002:a05:622a:4c83:b0:50f:b4c0:62ff with SMTP id d75a77b69052e-5104bfa6b9amr166830981cf.54.1777940754397;
        Mon, 04 May 2026 17:25:54 -0700 (PDT)
X-Received: by 2002:a05:622a:4c83:b0:50f:b4c0:62ff with SMTP id d75a77b69052e-5104bfa6b9amr166830581cf.54.1777940753775;
        Mon, 04 May 2026 17:25:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393610ba09esm37132781fa.10.2026.05.04.17.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 17:25:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 05 May 2026 03:25:05 +0300
Subject: [PATCH v5 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-wb-drop-encoder-v5-8-42567b7c7af2@oss.qualcomm.com>
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
In-Reply-To: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
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
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
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
        Louis Chauvet <louis.chauvet@bootlin.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3014;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mE50BYUB/UAw+zq2VOqPPalyAMn1gAB1RtsYcBWwgx8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp+TjcXTDEmBL/PifKO5n4u9XdLzRyirOofSZ0t
 R5jHaCLw4uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafk43AAKCRCLPIo+Aiko
 1fRrCACGOoHDQH4QaIwa/GwT9MrEbWmX7l37G0lci0xr/0cZZGn7Xbv1H5YVaHy6Jy26K8OsEKv
 S1oFOWhfiWWmPop4LiH2xFuCDz445YbGw5v9bxZiZXLtNlN205+VCu6A1bTdwk/tZAQTCwt/hxY
 IIExi09aX3uRiJsDHR829mUb96OKDFC+vddC2WLqFsb7j50M4INLuMHhJqKqEcywPNc7D7S/SK0
 1vtK25FJGIvjReowOwc6NBiilcdlB9HAjDCzR1ne8Jkg02DObvbQ3PEIOtNJFcQDRfdCBH8J3sN
 s1qv0znAaU8Hh2jKuzUPWrKL35p3EJV4cPleldHBAY1yYn0z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAwMiBTYWx0ZWRfXwChRohv6ffcP
 kWqkJjtrnbj4APKEEvFUq7CXdHEpqS7hZglKfv+LVRIe1MWOPKtYN//Ral8E62rB+QqiwnK4uly
 02l8IOb4fTCcaNNYZvmgPIEypUrv3M3hWmFZyfvFFem7VkjYrAnt4fjYtoGyzo4wU6Xi0xk9sZw
 iOAANyix53/cQHHQRMQXOHO4SLeRS4+SOmJAyR36Fff04q30yi3QSVNJo9ZWKgxJPHD8XA7pWp8
 IGraVy654L3yRE/I1G0Oxi2hmIW1ZOlgofF5QCSTjGTrxd8ab/R7+gLo/f1fQkEWOE/dffEB5zz
 MgIwkj0zGCUPI7Ig6GUtDYLwGgDZ/WyVF9Y4t1pc7t07rhqaonO7oT1aAMoQ8+nK39yf0/N+afG
 0AAt7uXxvfOan0ByBbGjIaCYHFdBa5S53PuSCnV1RZp6DTRNUewlcTb4ZeRn3bEZ67UXh8EjpjJ
 LTWiqEkA6M5hL6xu6Ow==
X-Proofpoint-ORIG-GUID: 09mWdfbjYzAkXSW837LH_o96KfTTJCOG
X-Proofpoint-GUID: 09mWdfbjYzAkXSW837LH_o96KfTTJCOG
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f93913 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=By2WwYRBACVvdXAjiroA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050002
X-Rspamd-Queue-Id: 5E0BF4C552E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31979-lists,linux-renesas-soc=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,bootlin.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

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
index 9fc15168c34f..68fdac745f42 100644
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


