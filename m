Return-Path: <linux-renesas-soc+bounces-33955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id McJHEmJRLGpNPQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:35:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B14167BC58
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:35:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dVL5BU2p;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="b6U/eEhX";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52630337D098
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24F239A808;
	Fri, 12 Jun 2026 18:30:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578EE36AB54
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289034; cv=none; b=FKEpXYsCzcwcUl+s+U3VFF/PWeZDViEXXbJlBkG0UoB5GC6RNx5b17dhfu31nDTgWr6WXdkQkLx6JR5xkiIthH5qBb9vHOwB4Y0GcqlvYz02l/U+YbwL1RYIySDvQcfiiFad57/aWcj+SHC4RU+XSeAS5dg/XImfBK7CZpRb5kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289034; c=relaxed/simple;
	bh=4Vucpdbps+yQVez32oDVtzt/iw6YyMI2r6E/Wi913Hw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J6D7IhO+sICEiy2xYR+BKfpFubydYGC28ElNIKAtk3AQrie8cbDVCwIAgs/f5QuZeBNEe0koh8+oOozD5XQYOrlEorHsh1GafwnFMWNTc9XDRivQatXu3+IwywNTQ8KMHchu3t8o+tSqmY/jjRYrgT+McJU++ZaXprtGi9YyQsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVL5BU2p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6U/eEhX; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGUJxB053986
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sTMi+rpeIeeTxwgAvd6Vb3BN+nfcxX4j3a3avZMj7+E=; b=dVL5BU2p5TxAPTdi
	S28MTvYXq86i+lhwR0HsWJot0vqed5Q82o8xOa1w+PaY4AYkw+ZdIC9xho1H4G/R
	Eg+Y0ltF4oVtQaKmvMa3k1+d+qqvQH4lH2iU/R8iRFX4qKKkWy2Xo5RbRidP3OXH
	AMhXLIrYWFn5kc0TMkqkYmh/GNb1hFoFrJ60ZCiw1Wwx9EQ2svsj03axFNKFIwew
	QN/lhY36dlaRIUs3D2RD7VZBCRaSBE1HeA5XAqLUwwET9iNqA7Mzj/iGugIOBz3P
	ffxADznUhAPiWxkM3tnnwOxLqDUIkU9RESdvor7Ns7uK3ja5rX3xsS14XLJGvBIe
	t8SRgw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29uv65p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915d33f7c28so246125485a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 11:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781289032; x=1781893832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTMi+rpeIeeTxwgAvd6Vb3BN+nfcxX4j3a3avZMj7+E=;
        b=b6U/eEhXlcr7+Tp04+luHc6WjHWMpx2KsVfc0IWxbJ9YFnz3roTdata50YAJj2VJT/
         0lkavYjbThXT/YHr5ZZcPmdXc9qw7npR5wrfFmq9E7wwNtFyHf3zFO7X3vvYHYZgI87g
         7/044scHuBpcXhZY+jZM6AS/epbAPmQpKY6rYOVRsNk/iDp7DD0dD8rdD58YDND4r4wn
         Tmh2/NwA8D5tscVuqaUwinRsJHEBNNHCsgQU6W5OjmPyt7SEM3ZG4aSjzhKsFxSga2pz
         pRPWjNb67QXyzIzQogTevwwxrdWLH5nh8a3jW8um+6yHOIBuQUznF16KJ5wfA5R4otC/
         6WkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289032; x=1781893832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sTMi+rpeIeeTxwgAvd6Vb3BN+nfcxX4j3a3avZMj7+E=;
        b=j+LZ+VgWTGBBYTCnxBJV0BJTZ8r+TavmVZEVkSIHn9Vpo5yyiqEmS1WL7WShhb124y
         MOj63dP7RXupyjNIHwZ7/EPmLPRzIRU+yXYPn5HQs2BmLGSa/v5a9hIPMGfutXepLsfM
         4/9LZw8n4CVf/d2YECJbQH3au5D+csnNpYZc2LA9alHn4Pa/s+UExfWexBVG9dVxX8Lf
         8jB0jaFBWM3kCLJC+NnV//YduZfhJ35g060MDtAUkpecHXoDZDgBIfRJ5/9BXVw3CUC6
         ifDK5CNvgf/XlZoRe0epkU3p4khszdpwsb4gJgMl9T7SAJAaHej/PBW2ZBHcnZ403Xmq
         u3BA==
X-Forwarded-Encrypted: i=1; AFNElJ/d6wdinSqJr9brPwXNVNq8QyaD4NjZxOMMFkiMBrnO/Vlkx4amTfjl7gY5jj7L0jp7Z4xvQ0P9l1qIJpX/XMSTIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRr0RV6riYzLotQVqao3342yZ/j+pm3QDbOx5VTK1e1eTo0fXr
	DHv0Y+QG5Ckzrr0IHxl5P5rZk3yOqyC25ilQkp2ur+cD8c4pApYjFGKplarEotiRt02IYimkasx
	8xwjplCgD+vAR2vo7z3/XMTnoAKiBw/sTW27AIXBXWCv6rZY3TB3pljcGyfHsPm3u6DyZ+sZfiQ
	==
X-Gm-Gg: Acq92OHyu/XMH7MhdRuOG0g3fZFBTaKza9EiC8rWcmhIq3GhP6r9tlsiRoZEatMyDvt
	3FyHsg1oVChEAWovYQL0PkzivlDMqN0U/tkG7HK1THZZuHuKZKlngbzFr7cq1XVBL+fuksN5Sxt
	oGoKFWU96ofxeZVKcstwye0ofEpYew77k1qtmui59hliD3XrmvduXVyLjLIqBx8hmduSWZsIRLw
	OEmnU8vZGpHqWAVlXJV0jRqfsRYhm2UYSAvQkZh0C/LU2bwUoJtBwZsBl7W5ksJx5t9Odx0cQ9i
	iFuDKA8+cSJ9s+OPup0NlAM11P/ulM57D4Dfpnc04uYUTWRtI1bkCfBHtHHvx5rrLYeXASK6kLp
	pDS6oDf0JxSBvdyMwvSHlYQZKoIzpb5JExlmtpsXlhmqKrzYZ18KSWukKe+jTQc5VDT5UpC/dar
	JfFWYoplrUeNbI8vt+x60JSKzbXmY9s/mD4Do=
X-Received: by 2002:a05:620a:6497:b0:915:cda5:2807 with SMTP id af79cd13be357-917f1c595d9mr132340985a.57.1781289031603;
        Fri, 12 Jun 2026 11:30:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6497:b0:915:cda5:2807 with SMTP id af79cd13be357-917f1c595d9mr132325485a.57.1781289031019;
        Fri, 12 Jun 2026 11:30:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161fefsm742173e87.8.2026.06.12.11.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:30:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 21:30:16 +0300
Subject: [PATCH v6 6/9] drm: renesas: rcar-du: use
 drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-wb-drop-encoder-v6-6-9f3a54f81310@oss.qualcomm.com>
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
        Suraj Kandpal <suraj.kandpal@intel.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2589;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4Vucpdbps+yQVez32oDVtzt/iw6YyMI2r6E/Wi913Hw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqLFA2qL8S5YQqKBPsRn9MTFivondiBpU/eAjZX
 v1710/GiaSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaixQNgAKCRCLPIo+Aiko
 1bx1B/4qwPQtIu7I3Bwv5Sn6D3nPGP9G7fSvF58H/+/1e+BmXtWR0I52tzdypAxD6UGIshghp6r
 R9fC/vVHKY+cJlSIAkJvzdeviVpFG8H828Z976B2ZSeqgJ90a7o+vkfJEY03HCbBS9KVHQVmlWk
 wa43sUxKRxXS3xARc/fyWzjCVBtId3lFolo/JGuYlcdRpBqeoZB599OZQEeLetXVly3F13qILYK
 2pztXlzGcfm5HDqC6ZOH+E2UHqSGHreRU202s3H9mR2LSXaYbnAc+lwUfurempYYfrNrKzpnXyA
 kqUq1HqnbLF9EiHxM4hNn5Dyyf5KvcLTbq6A43ZbRgqn8F9/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfX4pEh+Z4CHBTf
 QmugxRalcqfJ8jS2mozTQLRXGcVA0rGlS/j48SUXGZJxY1I2bt0wrpuJfnkQrIr52qMbI/qy5j0
 2YaHhwODLZHwS4xIgM6+cGz6zhSvfM0=
X-Proofpoint-GUID: 5-2Vrud1tF7cyu2W8BiHNnW9eoeiHjGl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfXwu+N3HkPYfZ9
 nWEIbwQGcuInIY3K7/s4kQHeKFymtyNctmAT9kR8aR4plM4NaFlmqGahoYOjtq5WBZ0VtIi31Sy
 dYMBUtI8fAkut42RmqksjESTgTrwGuo1+McHAwRHeXm2ekLMzYAhnzRFkka81wdoHncjB7h7gxD
 Ixl+UpQ1NSLEGIFVKP9bcZLVLiGg+4rQ4+zIZ8Y4/FKvuF1JlVIsZm+P2FDONBFBOvFnBi0bEoQ
 XemJahnSMBRJVGqE7lIpBPwHBctdhf/E9EjHoiYoivu/XhGtEbB49EMJtK+zF2WZNnPwfC3+EiT
 6LZP+OCSPMWgdmYb7hBneFJ1353X2EoXa2oWSwvGIhwT8wc8GdolvHdgLLlokb6AwJozrFeQ2Rk
 m+WU10EpwwxLgtu1zga/LhFdWuj1A8xqWjlUTVUlMfSR9d7h7Zvq7Fz0YMvMM0UeYq1ZOsrqW26
 9/+5xqqVzApyVcYOtcw==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2c5048 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=rEXDA0v2x0ZtafRnR6sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: 5-2Vrud1tF7cyu2W8BiHNnW9eoeiHjGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120173
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33955-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,arm.com,ideasonboard.com,glider.be,raspberrypi.com];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:liviu.dudau@arm.com,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:suraj.kandpal@intel.com,m:louis.chauvet@bootlin.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B14167BC58

The driver uses drm_writeback_connector_init() instead of its drmm
counterpart, but it doesn't perform the job queue cleanup (neither
manually nor by calling drm_writeback_connector_cleanup()). On the
contrary, the drmm_writeback_connector_init() function ensures the
proper cleanup of the job queue.

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index e5e6e6a156aa..ecfd4fc1f210 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -134,7 +134,6 @@ static void rcar_du_wb_conn_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs rcar_du_wb_conn_funcs = {
 	.reset = rcar_du_wb_conn_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = rcar_du_wb_conn_duplicate_state,
 	.atomic_destroy_state = rcar_du_wb_conn_destroy_state,
 };
@@ -201,16 +200,25 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 			   struct rcar_du_crtc *rcrtc)
 {
 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&rcdu->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &rcar_du_wb_enc_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&rcrtc->crtc);
 
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
-					    &rcar_du_wb_conn_funcs,
-					    &rcar_du_wb_enc_helper_funcs,
-					    writeback_formats,
-					    ARRAY_SIZE(writeback_formats),
-					    1 << drm_crtc_index(&rcrtc->crtc));
+	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
+					     &rcar_du_wb_conn_funcs,
+					     encoder,
+					     writeback_formats,
+					     ARRAY_SIZE(writeback_formats));
 }
 
 void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,

-- 
2.47.3


