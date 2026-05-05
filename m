Return-Path: <linux-renesas-soc+bounces-31974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PU8IE05+Wm46wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 02:26:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC6C4C555D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 02:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33FC1303E2F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 00:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C389279355;
	Tue,  5 May 2026 00:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1dGjabG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIummX6L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06FA275848
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 00:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940729; cv=none; b=hYHQJO2h8V57uCHpG8QRrjx5TpnsnMPR+RDyGyb+Rp+EU0nodIR9ziCU+VUVzBFZqwDXEVA8zEJAjnGFyNEfAZ2dN2iWL+0Ngw5a4cfIwQaLifTtxMKOb8vsMqY2H6o3F/Vj8CKgCCKpxUt32N5QCEV8xLbLLyMJZ7C4o4Ku7Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940729; c=relaxed/simple;
	bh=MhO3rZwygKwYvVhbAVjitmlBMP9oPZA7uZa37YA1WtY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLkjY1IFjYz0oqDLQMJvlxSAVP9mJwsVmPGMBwcDdnfx8WTuJTcGJZ4VFw3genIZ0itURCdRxsZhzeYsnpD7W8X3unB7YbXbv1eHL5J4rUKe3SIeIJUsRvxj/qm2A1voR2Uy2gMQ8ijqfhcoRFVyVRdTt8lbyCHohienOCQHU4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1dGjabG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIummX6L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644JUuau3467670
	for <linux-renesas-soc@vger.kernel.org>; Tue, 5 May 2026 00:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvUq8Kk9vuSdbxC2mnaQWgVoYwyqvsDFVMNCLtB92nE=; b=b1dGjabGKyCNTbxD
	yLDHiPiPeFvVWtTCkRJYDrg/dp/nU2DyCcAL/+dYSlOjmTsGeufe1sG3LJv4X6KI
	6nFt9RHqTHrleZsnidTesSppQ/GDCRv8SSRtzGAmf4GtMS7jWQjAFAE5r+Cp1tUT
	sA9whihcJKSdWmkvHgm7/CV0GG1bEMNR0W1R7KsZIG1E2hOiz8dYEFob+dDInPzU
	kwVhb0roTk/XPiVKqgvrAkqFgLoZrFRwQEoIFX5MqdvevQ4CuAKOqaSTtSce1L/V
	cdVodcjRpMIBljUL2IuiNzYaYEuW+EcOSK67DMaakYd7jompYkuPW6Q7k+DEuZkQ
	3UPZ8A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvtjt4mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 00:25:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d812c898cso117834781cf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 17:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777940726; x=1778545526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvUq8Kk9vuSdbxC2mnaQWgVoYwyqvsDFVMNCLtB92nE=;
        b=WIummX6LxPwf1nP1vYUf2aPoa6Vg9vMyZ75ZVGpmwVDysD0KBVXPHTFMD3uZFN1tiX
         w3IdKN3Q834jtmy5981lErEiDrBXjC6evJGOenXkHACfhvUz+xU8uy3V09EKn+cvTbzW
         omsEZ7VysQbgy3CHxV2/7o35hh3HjTjG1A32uSlziEzfJATCCfs0VhDik8z6IvFRcq4T
         nNy2uzSEFwNwhbR/lVSJuPn+NmAlzeVfuO7RkJSHAyCVOnyZQhf2joRcfLzbwWiwFZR1
         N5bxW1xVfoCh7RVKB1RStUq9+JTxxfjCuckloxQGi1rVolIygKP0wZq/L6DKTv6Xc7x1
         dF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777940726; x=1778545526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rvUq8Kk9vuSdbxC2mnaQWgVoYwyqvsDFVMNCLtB92nE=;
        b=dJxMOzm46fHU6tNjSQTgs/9QVuG7nhmyXc7rBkQOJiu9YXi20UeXBMJMcu2soxA9Ka
         dUiwpUSTp8ehhsi4zklT79cP12sC2LGoq5SchegS+3nBT6YIAOVVC5Id4X3E/vM9Zxrk
         /+ggsTT++sTxEUnE5xSa8SXx9cp64QdAuCkWswzTnJuG08EaClON1Lh7XnRRaRUFSz4B
         LnVON1VMs076/jnBk/6xc6OcjEp4pNWzrQ9xPlLsEDZEsEPEz95dmpbxwBwyKSwqiUUZ
         SVQhX5MFltLVRKLDKyY8GNGCcZeoGClQjS5OTD8dIDGNFuQd56m96Jj7KrObImoUGvOt
         1s/A==
X-Forwarded-Encrypted: i=1; AFNElJ/MJnF4u+LxeDJqCLmhViVPvB/3nPDBJHwEYFhYTQyZiY1mSna+H3T/p8OlWkYhgVmH9Svy3LvfzIGz2TrrcJc76A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh3wLPm6PTpl04k1+KNp6SJYiBkSpnjpCj+tdgdktPkW0Hr2PR
	dbl3Giw0fm4osSnY+FPShilFaR+dUHecyx1EjTpcpOi5yFJ8D1arq+Mhu5NGZUf9vN/lSTrN47x
	Tl8njo+t4/bqtlBEe5CnjJtws1Lw9JGFj12BM1wA1V4vxXbL2C7znQJl78t9Tg6iysqPJjwvx0o
	wwgn2lng==
X-Gm-Gg: AeBDieuWw8BTSHXPhbbpkXYX+H+OqmWx+7DeWvT/iGe/A6yd1irzvQ7ru6VUsX2lV1f
	GvKR1UJwX5ZzgYtZqBhGgisvtpgvkaUy8SPWSjKFlGHa7aC8QNhC5k4jV1841U6c6LAkeE+wwNb
	UAxbcfGzU6oAi6PAKNDO6VTx0dKuuJDv1w3g4Ghi77VZQX7bBeCQFGb5nlU05NV0vpv3QI9N9Bh
	bfCOrt8HBdzevZoPImvDBsSihtGlq1mOiQqMQLizAvgbkIrKZmwKdZayPcbg+9USYR4taCDWJtP
	oDI1tHTBtRSjhYDe7EizIqytUNf5hcHVBptfha7rnsitvXulESCIs5QaspeJzHi9zMi4/zzwfc4
	Ob3Rwdd268cix0kaFfmSTzFyOn0fLHh4sd0ojKU9QxRb3heYE1uJ4Biin9bzzwkkGMjXKhIChtm
	tHZ5GbNmzAKg5KwGEFmaT/1Vtz68/A+COhjSwMTvKYdIJUhQ==
X-Received: by 2002:a05:622a:40d:b0:50e:defb:9dca with SMTP id d75a77b69052e-5104bfece5emr172357791cf.45.1777940726061;
        Mon, 04 May 2026 17:25:26 -0700 (PDT)
X-Received: by 2002:a05:622a:40d:b0:50e:defb:9dca with SMTP id d75a77b69052e-5104bfece5emr172357201cf.45.1777940725522;
        Mon, 04 May 2026 17:25:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393610ba09esm37132781fa.10.2026.05.04.17.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 17:25:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 05 May 2026 03:25:00 +0300
Subject: [PATCH v5 3/8] drm/komeda: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-wb-drop-encoder-v5-3-42567b7c7af2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3249;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MhO3rZwygKwYvVhbAVjitmlBMP9oPZA7uZa37YA1WtY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+ZPizsaWSG++ua3XqdZxT4V8/nV/ol/R89c0bPvy9Qf3
 lvLEfS6k9GIhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT0eBi/7FXLqU1JluVYXnM
 ek7FCO7OM2kLzANuVBVN6F3g+c0rNvzj/w9/CroPP5Qxya3MiJO1j/S7mKAp8+HIUsWTyzh5PM7
 Z+GdqSh1NLF8v4TN5Uju7/TrRv3eEJzyaeanu8Zdol8sGG03WbTixIs/oTOdK+6SX+iprN62Pm3
 gtZBm3l1SMrpmi3GtBXU51M/M/+XP35866ZvohUE3PJoOtoCfgn0BvkfjByEtO1ct/vDxVsn+7N
 7c7Z2eNjQGTfbv1303fVcMW9m28Vx/F0Pq43vgk14Rcy1MbGhLOKGl9DpNKqjh4YmnPF8l7Rgpf
 WgOr+IwL71fOPSEeeUTI6hmD0KGVmncjd6t53GyrDAEA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: bfLaQGrjqy2NVLNNnZ8sB6sE12uoIptb
X-Authority-Analysis: v=2.4 cv=KuN9H2WN c=1 sm=1 tr=0 ts=69f938f7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=gYs8AAvg_5cFonjPjrYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAwMSBTYWx0ZWRfX3sLNzh5dqfMa
 YjfiDaZ6nQAFiaoLZVjZX3ODaiYC6UIZKMSQmCVJoRhuFo50UrvNJeoiqiJ4XrysXU1I/JyeEyC
 pTW+VeywXs6eE073ljLKt+mKeWKM4blyFvFit0DReJlBieIW8PMoBvsJctNYJn4DWwqOXgHEUYd
 r4ufkLp9o+GsbH4FqlytZMrgay3nW/1sAHHjn4LuF9O1xGGdHBabrcLHZ4cfI9rzwTgNYS8OGde
 WTykaNiMOXT0z1JZjc74RGFoN9gyn5C8ldcTlFPaYHPopLhOH72oDL+zfYnr8+sk6A0LtMVaMHe
 QFnppB74FGCqB8eS6i0YM9F82kaHboSNfxeL63AbBzMPzS+AGlznY9HyIRWrbwCdz6QkAWuCzpO
 bWwA7aGu0Xlcy94tm/oVeB06e17TvKGcW62zRWH7uBeddI6UG7CyCYkhrVp32SnsA/+NlaJCQa/
 09LbF2xZKf3JnbU/Z0A==
X-Proofpoint-ORIG-GUID: bfLaQGrjqy2NVLNNnZ8sB6sE12uoIptb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050001
X-Rspamd-Queue-Id: 2CC6C4C555D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31974-lists,linux-renesas-soc=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
 .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++++++++----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
index 41cc3e080dc9..bcc53d4015f1 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
@@ -5,6 +5,7 @@
  *
  */
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_managed.h>
 #include "komeda_dev.h"
 #include "komeda_kms.h"
 
@@ -121,17 +122,10 @@ komeda_wb_connector_fill_modes(struct drm_connector *connector,
 	return 0;
 }
 
-static void komeda_wb_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-	kfree(to_kconn(to_wb_conn(connector)));
-}
-
 static const struct drm_connector_funcs komeda_wb_connector_funcs = {
 	.reset			= drm_atomic_helper_connector_reset,
 	.detect			= komeda_wb_connector_detect,
 	.fill_modes		= komeda_wb_connector_fill_modes,
-	.destroy		= komeda_wb_connector_destroy,
 	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
@@ -143,13 +137,15 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 	struct komeda_wb_connector *kwb_conn;
 	struct drm_writeback_connector *wb_conn;
 	struct drm_display_info *info;
+	struct drm_encoder *encoder;
+
 	u32 *formats, n_formats = 0;
 	int err;
 
 	if (!kcrtc->master->wb_layer)
 		return 0;
 
-	kwb_conn = kzalloc_obj(*kwb_conn);
+	kwb_conn = drmm_kzalloc(&kms->base, sizeof(*kwb_conn), GFP_KERNEL);
 	if (!kwb_conn)
 		return -ENOMEM;
 
@@ -165,11 +161,19 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
 		return -ENOMEM;
 	}
 
-	err = drm_writeback_connector_init(&kms->base, wb_conn,
-					   &komeda_wb_connector_funcs,
-					   &komeda_wb_encoder_helper_funcs,
-					   formats, n_formats,
-					   BIT(drm_crtc_index(&kcrtc->base)));
+	encoder = drmm_plain_encoder_alloc(&kms->base, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &komeda_wb_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&kcrtc->base);
+
+	err = drmm_writeback_connector_init(&kms->base, wb_conn,
+					    &komeda_wb_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	komeda_put_fourcc_list(formats);
 	if (err) {
 		kfree(kwb_conn);

-- 
2.47.3


