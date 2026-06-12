Return-Path: <linux-renesas-soc+bounces-33953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KkPAFJtQLGoYPQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:31:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BF667BBD1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:31:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ivZnQjum;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="jy2J/WQP";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 275B9300A272
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C45238E8AD;
	Fri, 12 Jun 2026 18:30:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48E534CFDA
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289032; cv=none; b=LtmIeW4DLJuu4pP/lETjjT3kdo/E588A7txMSxX+F2fphhklWRu0aDfuycydZxe+cBchX6lZFJ4XrrXcgeNSYyx+QR48edzAmTDfUoIYdXJpt30WLzYA3tGgg/3bt35wREXAPyCe6oLUMTf2oscdELLqckGicGthLp36rbVOTbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289032; c=relaxed/simple;
	bh=ns6ZF2Athx6EXhPPsCUzdeEz8OHVy14bl5aTVdNnAU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U2s+nFYQjOBlDdipglG1BkygBG1PspEiKmnFm3rRP2i94kjk7E20n+dfSkbzrib5BSVkj9GkYKStoh0Avg48sDLJCfVQQX/l38Bb1BQbrf5Pog8wqGmuZSxPBKf4JVfIv9zqwRNh+jqmbKNQ1w67qdRn6KP2gEGuTzkFkjpn04k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ivZnQjum; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jy2J/WQP; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGUSwC055514
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VAc5Ikptycwe+SAdBBV6cT/v4cLIQIAkYHbY8Re0nJ8=; b=ivZnQjumAYn2ffrl
	Is7Sqx+bhSIzdvC7QxA7pmrNJEMhayWPE0cI+oG5wiLKNDeGlQayknv61BqZtUEf
	67MjnN7JcLD5O8FfZ+hDb5kLXtfidZb6E6gg1YmI4eFOmmjuc2UKM//YSgSWs/R0
	+seWyK/ZwXEJhtPfySsS6VMAkDWHI7Q4SdFa+SIjW/wY0aF+LEuO4M2bFJxRXjfa
	y12GojzejfbWsQSiK5GYXPfHPu+OOJTAxo11p2LznsRppvPat9ihKmXDafdqicG0
	g1AhstVX2RVdddrKeSIhnvNsk2BxVw6kF2SD+uqShvJaTNzGfGk5hI7sBbs1feBs
	RuRDVQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er29uv65c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9159bc52211so181389185a.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 11:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781289029; x=1781893829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VAc5Ikptycwe+SAdBBV6cT/v4cLIQIAkYHbY8Re0nJ8=;
        b=jy2J/WQP9vK6uB72OK57SpbBB4+9i+tY89SOSs9wONdw0T3JYM4JnMrdZ/Dj8jZ/DR
         kyBr02mbYPgqPevpJrNU/QzAueB7A1VrT3M7KP0kDvVKE8sCfN/eYlMltDDWOhxA0Pd4
         puysfZLOY5H9NP1eUBfDPMAo6iGRcFSqXncQgz1ITWaDC6EvItWyRWCEDG36io4YFBNc
         WDGtskHBngZakpXBxALdBK9w1WZzY9ugI/QBfEOIv7oDwt4tr6OzyFFDHwK4VsvfinW6
         iObVNExOmQNgzYtafT0su9ccG6glkOY2PW2W9UfJBmKb7whp3ZrQR832p3UDc/NlCLPi
         UjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289029; x=1781893829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VAc5Ikptycwe+SAdBBV6cT/v4cLIQIAkYHbY8Re0nJ8=;
        b=PXfg78v6T5c63xxcqHAZuSO/VAnC+6INa+QfacAD0UsClqFlNv8QegRuUunAFK9sZx
         Yg8Z3lsvMin5g7vUYldARDwYvS5OpTppS6+GMDYVeXsGT5TUrWLbW941iQIpreuc1XVs
         YbKq0e7xDqshIZ+MYlBM4V4nNAyGS5z6rLEdYw7yLIDOghURkqNKjMw+FjfZwQi0vcsp
         UYrngMdzu4WrZ1qQbKecaValf4r4uCZOQukLOWzVgieJNV/0zX6w3QMhaeUUoHrOYM4/
         2x0S++5GTV5xMboYbJSI7MQcJ8O/yICYuwKcdzIM3aX1b09rasAaMd+LChkmYGikpD5H
         Emvg==
X-Forwarded-Encrypted: i=1; AFNElJ/Ae0HjfLX22AHG41bo56MMrz+IjDFYCzHcOuA34Qnl6Yn86Ehe556dOBD621yva16nRRq1oZDNNurD3wUsJSHBig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1nidw/GWBnIzJ4uHI8D893aqM/JLx48nJW8ehBg6jonoi+VnO
	b83WhCzJfZXBQcYR9D2eznJfA5y5ABBPDlC6e9oocL992Ozd2ccYW28eSxH2jbAyQrt5/+zh3Cq
	MbV2HSQoF3UL/QSHQg0+9YrXoeiSves4ygkvKMTXJyKDCt8QzErWX4apXVRn9QHRRj/po/YcnPw
	==
X-Gm-Gg: Acq92OFWuwN+GyDwY35dtuVRZj/SxEqUb1Yvg6nvvCSTqgBtzqlNNJYUHlUIXfVq4qw
	+hWQoIQ0tRV0cmMPtAIrpruYFFFNY2ltoou2iwfXtZcJ0zuuZT+p3vFbe/91/vKwhFWMZ5yYoiF
	/Ccpjti94YMA33z4JMgn68FewpAWsNJSM4GQYVAwWgc34N5ol0SWwxiCRcGH+Wt+rG4KJRBLumm
	Yt/J7XVCfHITH1x5k99sM3RyiO2nTvkTW3HF91pCz5S7FmQ2DJIggDQRDN6ouNV5uD8yg0pKtXe
	WMqkh3ztsfFy39Pdcc+Ta+dEAMkNHfQ7JZbACmRTSN2uldRcDhamZ29x1rGH+RcRBzLVkPfYeo4
	W0C5Pw3ZRe9mPiAYWuvfN4RhetklSYPISLZCZGH1tOg58sxD/b5EPdffIYhI7TU7yFGPybnzxjt
	6Me4zTLor5jv1y4LLcgiMdEg4seywDZj7ubFs=
X-Received: by 2002:a05:620a:bc8:b0:915:a73e:3544 with SMTP id af79cd13be357-917f1c56720mr144564785a.56.1781289024578;
        Fri, 12 Jun 2026 11:30:24 -0700 (PDT)
X-Received: by 2002:a05:620a:bc8:b0:915:a73e:3544 with SMTP id af79cd13be357-917f1c56720mr144477285a.56.1781289020618;
        Fri, 12 Jun 2026 11:30:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161fefsm742173e87.8.2026.06.12.11.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:30:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 21:30:11 +0300
Subject: [PATCH v6 1/9] drm/managed: implement managed versions of
 kzalloc_obj/objs()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-wb-drop-encoder-v6-1-9f3a54f81310@oss.qualcomm.com>
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
        amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1773;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ns6ZF2Athx6EXhPPsCUzdeEz8OHVy14bl5aTVdNnAU0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqLFA2BP6d00ejrEHxJYdHp2X9IJejczYLfY75d
 jXdts+qMaCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaixQNgAKCRCLPIo+Aiko
 1YyuB/4/+1uiqA2fryPtK0Q7ctr1kG3ePgcUSkHFnblElLxP9p5KAV0NVSrsZu64PP9Uw8QhEHn
 eku5gVTB4fteWoAdmRV6MqED5jUCgtzKxXw31I6q2yE0HMzROPxsuZqjck649m6vQ+6gjWPoIYP
 tSvCAE8vpvPK2pQ8s47BDO71QWO174Xdq0Kyv6QPCsjDT1q5muBBfuIckdqMamMRRmXbJArYrNK
 GKbQ97M3DoUAW3s0S8dCBmtmiaDK2EvYKKZZ6xfYMjkleX/ieanilprQ/xFXxojPr8xMZnF96Zd
 t+bDLo/Q7QnIlQtPjN+RW8IeT2wx6PpYUovOoPNAnHFW6kFr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfX0cZyRFElUOkK
 bUJA5Vc5NA7MoTqZd0/jV2cbh8AVPzJXn+7lZmgqbLsR6XZE9F2aL2YzSwlbX+U6I+KoX8YRZ0g
 kXq8hPEsB2clMWcISC2/aKDMunoXCdQ=
X-Proofpoint-GUID: B98oQq28FjbnqZJD-wScyeuRPIiysel6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfX3gwsOw7GX5oO
 LslTIoHHZQuG3UW1kMeRDMHcNn+5Umwti2N25QxBq0n1YUWrkiLTebUPBLOxSGQDPz0tDUuhV2s
 tGYaYc8Ou4408moTHEgcAlE0nyO8fCxU4qoymtBe6IXP+E9RS3w8iQHsw52detALYkmuS/MeMhi
 zyvsKPHRRpYM2anevMEK7ojFKjdjVm4K94sARsW9hksEYJagHs/toYSjkMUoCmo4tD3yVF/FUBi
 YTrgpjo1VpSOcm3QrbY0jfUl6ZcoebVgiWsXOH8SEtdH2Q/H8CJk1QRupPWmywjENuXkConJM5P
 h1OO7aku6RvmuetmYDNRVNfZYZfbsRK55rPpMKb8lUXZr/cxdwY1AUWiomh8oe1JsBnagDFJ4Vq
 tTnalIzPRuODv2bnIxU+mn50RswxbzeJ62PZnkO2u3DZjgqw3Wc3LbYA3lEl6Ex0YykfmhNeoKU
 QOwbFU6HQC6rEbaNalQ==
X-Authority-Analysis: v=2.4 cv=DppmPm/+ c=1 sm=1 tr=0 ts=6a2c5045 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=6OF_V-VfZv2apoI2bYYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: B98oQq28FjbnqZJD-wScyeuRPIiysel6
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33953-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,arm.com,ideasonboard.com,glider.be,raspberrypi.com];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:liviu.dudau@arm.com,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 68BF667BBD1

The kzalloc_obj() and kzalloc_objs() functions proven to be useful and
widely used for the reset of the kernel. Implement a drm_device-managed
versions of those macros to mix the nice interface with the automatic
freeing of the pointers.

Note: the original macros accept optional GFP_foo arguments. They are
skipped for now, making all allocations use GFP_KERNEL. If necessary,
support for overriding the GFP type can be introduced later.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/drm/drm_managed.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index 72d0d68be226..79049bec277d 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -105,6 +105,28 @@ static inline void *drmm_kcalloc(struct drm_device *dev,
 	return drmm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
 }
 
+/**
+ * drmm_kzalloc_objs - &drm_device-managed kzalloc_objs()
+ * @dev: DRM device
+ * @p: Variable or type to allocate an array of
+ * @count: How many elements in the array
+ *
+ * Returns: newly allocated pointer to the zeroed array of @P on success, or
+ * NULL on failure.
+ */
+#define drmm_kzalloc_objs(dev, p, count) \
+	drmm_kcalloc(dev, count, sizeof(typeof(p)), GFP_KERNEL)
+
+/**
+ * drmm_kzalloc_obj - &drm_device-managed kzalloc_obj()
+ * @dev: DRM device
+ * @p: Variable or type to allocate
+ *
+ * Returns: newly allocated pointer to a @p on success, or NULL on failure.
+ */
+#define drmm_kzalloc_obj(dev, P) \
+	drmm_kzalloc_objs(dev, P, 1)
+
 char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
 
 void drmm_kfree(struct drm_device *dev, void *data);

-- 
2.47.3


