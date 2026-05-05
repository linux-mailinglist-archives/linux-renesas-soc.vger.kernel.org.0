Return-Path: <linux-renesas-soc+bounces-31973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACRFMjQ5+Wni6wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 02:26:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 667154C5545
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 02:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98082303717A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 00:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C77279329;
	Tue,  5 May 2026 00:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6xjJCq/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UKZwy5cQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5DC275B15
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 00:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940722; cv=none; b=IEzIdNSCUTgqRL8XqyeLLxrfOf23tgHkZ9SLaxCO2VepHokEL907u+4dLvqJFaVcRGp1uThARxDkMAAVLcOV8c/Tee+uTNk+mjA0bmsXmoX8xp8dPXzzbLOyqsq9V1oTmrutrk6uMdgQ6chFJLdjA+gLJbRZY40crRU2R7x2cg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940722; c=relaxed/simple;
	bh=VXYhbpIFMk+a+YB6jZYpq3ZZlit2Dn3QcOteP6AnmKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mbf/P69Zpgo7LmLHa10lfWE8qICiTC1BXAvoALxv0I+Qu+uVvZY9TwIxnh25JBH+MWMgWz5tf3OTILCENxptmTlXiYcsCv3QYMkrs6sXJW+y8zIfV2jJHwafxGygWAuNnmNQH9rfk8oPNHrVWUHuetSVCQhK46vjhjIMgk+PdCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6xjJCq/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKZwy5cQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644Jd6RZ3468041
	for <linux-renesas-soc@vger.kernel.org>; Tue, 5 May 2026 00:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7lYNft/WMRlNnP4xWSfKA/IuNz2ut4KJmCGdJbOpww=; b=a6xjJCq/WGW1/FEM
	AdOoV8K8FXhR0RZB/vBwjxGX0g2ifoQWb9yrZiO0XgSWdU1NCoiOPoFvScJr5hpF
	ITM67h3/DDvA2kacUeU42bEvricMPNX5rNHpf7jA6kKAIxz0yRwwgRmABn8SjP7u
	YdVqXttMYNs1ODYuZ+L9abxvXvE8vie99PuFh7IKpGrFfNiyYgG9ZyxdR3YV7EQV
	tnX1vY021ex1AcqzTIlJ/+kyJk5c5HiOZwVAUTspB5oK3kLXGndx7gKef/K9wAqO
	9dIxCh6h/H5vw6Mbg59JY1rj7i0X2vFQPRfeQrK4ypYDK3jGJAVxT5rQbkQKtd/K
	vdI6YQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvtjt4kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 00:25:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5d1c2289so116327581cf.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 17:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777940719; x=1778545519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7lYNft/WMRlNnP4xWSfKA/IuNz2ut4KJmCGdJbOpww=;
        b=UKZwy5cQUrL8+6Ey1cgiMJVAvJ8JaxcS5ORjlbEKjGnhWoszIGQQ7CKUD14FYc4HEu
         aD2DJXNIUvv0c3eq0bpzSX+aMAZnOCQGixiIsjfRT/A1hGkaDVMqhgaYresf8RrSyirW
         dRa2ixhpQs0k7STCwQ4fb+JC6ZWU1rjjtG3VEIEj15+Y70f0cG4AVak39xEPA+CNqU42
         eaqh5Hc5wjSRJbBnDNp1saToSeEC+9lTtUpQ2vUsPn+3R3h0DBzV+5ZheNY/hSfLzlUs
         oeP7BdwuCvuQxaPr8Yv9rwdESj+0LBemRlosNjKSWSzpei1ECwdZnU9370i1kt1VT3I5
         ocnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777940719; x=1778545519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E7lYNft/WMRlNnP4xWSfKA/IuNz2ut4KJmCGdJbOpww=;
        b=KKwGpSOuaZ/nPSHWi81uJ+3+AAmQEPDKVGHKzy5W890wRWgYGQOWD56DBC+gLNusOF
         kQ/2BrpaJZ4JY0GubP3pPrSw3p2uySrO6fKs14iLKoJdRFw5P1AyP1S8YO3KDcXhkTsr
         g+Q1wtOSQSNpXMbHxpAQm4IPegqA6kuIH7Ifl+XIAnX3l4epNUxXI/x43dbjW9GhF+3P
         O54K7G9IxMoXk0gwIxCZnumsThyL7nyutyFPgQK0EHM9/g+Mdr1iRtjgnX55U/62NExQ
         4xhVO0QY2812IUC0tg2U2DGFbHcKR9fehECJ8DtQzhB7fZs9D0EtJ00zyGHli6QKTHmq
         Z+2g==
X-Forwarded-Encrypted: i=1; AFNElJ+j9SWex9Lt5rGUiehMvKnmuC+Q3KlQpx263chzcALnEX89ZvNENJYt68JdnIEjZToFpTtRJWVVpjylYPpgF8DTgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAW1wBCcKKUZTZ9FYAHoDv6sIJuR/+O+gbU1hD0RVQWJD7utV3
	c4pqV9/ltLCb+9Trn1hukcHbXv0MrUPZ02AZnxJy3eX/rAOFL+5/OS7b9QvsNT8oAKrmkESU40Z
	F/+tLXli/Gmpkd4ziDP7O1dSICPHP3VtU1gGQSwiXP7T0ciAlrwvDhBQ4JcTj+u4OvpJVWWpV+3
	0kHVn9Ng==
X-Gm-Gg: AeBDiev2VcLpLDXnTfAlTP8OTVxCP9cJKnKThhtjZVdXFrMF4vwxqsO9hEk/ym5loN6
	7RJ9OHKRYV/iyFcPSbWpSYoqIAmJoCg7jKobjWQr06FxE29yaJ8JIEZPixLXaJ0Eg9IkP4wRa9L
	OTYfU7ml/4yTTJ4prKi71fiD54cdrfsNQoRPg21jpfzClmVNKnAXE8lQnZN47P+0MQ65ycj9Ymr
	c9KR6XuIC7K+XC6wrzZas01qCLVVo8ljrXZYSLXPd+xwZ8IVJ9UpuFMjxlq3bqKNiYrYp2O8BEE
	6fUnLwQP1hL69DL4mLxdAlnlpA+MIwf72cEayX0OHccpqYO5s813thntjUv0Rxoz17fVs3m4SXl
	wGnyIJEEAWXfzElVQkIpvlP8TmU2gyqNfbS86W3kWYDjCmLPF24nNKXykS+TJIeG7q/utE+28Zn
	GyBV98cltI9QZwRYLG+ZnN7/yPtpLKwzaNtx/E0pNHqOwVJw==
X-Received: by 2002:a05:622a:418d:b0:50d:8172:714d with SMTP id d75a77b69052e-5104be0ecb3mr192101701cf.13.1777940719393;
        Mon, 04 May 2026 17:25:19 -0700 (PDT)
X-Received: by 2002:a05:622a:418d:b0:50d:8172:714d with SMTP id d75a77b69052e-5104be0ecb3mr192101041cf.13.1777940718915;
        Mon, 04 May 2026 17:25:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393610ba09esm37132781fa.10.2026.05.04.17.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 17:25:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 05 May 2026 03:24:59 +0300
Subject: [PATCH v5 2/8] drm/amd/display: use
 drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-wb-drop-encoder-v5-2-42567b7c7af2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3286;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VXYhbpIFMk+a+YB6jZYpq3ZZlit2Dn3QcOteP6AnmKk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp+TjbsYlM9JoBmtnVDGJmGqEqnq7lq33TSJtIg
 fTudvo5ePyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafk42wAKCRCLPIo+Aiko
 1QxTB/9Aa3eYPFv5Q5FBjOoEneEfa9E7vysKWQgDGcnuDOOIME+jIw5me0iDQ1TEa/4WOWWmwPI
 NHwxxo/GLd7CVVbYW8Y4rWuxFvlKoiiDI2OXKKOBSQbwdPcvSzKBSlRWUQh7sPliGuqZyb7nGFN
 igTh5bAOSsXDN5dINbSbqKQxg+p6LAx+9RvNaftKq77283JdnlFC6mzlZLAmyLWlPyjH6Nc3vu5
 6ej7HjsjMluWP5p2fqZxHuQSKKsEc3gTMKc7daHdFY3MlXj/UdzgBa19tQGge9K9imb5ta9xdp9
 Owf5c4Sf2/QkVE7onaa0l/6vZ/VxAnTo7WfujqfsdQ0ofKOh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: VoSDa3sY3E-UZKdML_c7-mS1f8JHDSAF
X-Authority-Analysis: v=2.4 cv=KuN9H2WN c=1 sm=1 tr=0 ts=69f938f0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=P-IC7800AAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=M-qvw7r3wQx8XY5Jx90A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAwMSBTYWx0ZWRfX6WXYa8y04JZC
 D8Wz2UyVScy0DunpeAVNHkNZZCtCIwXs0+E9LshSr4ayI49g7JkEdfm+xeDCFJ4JHOVLLDG+b72
 fGy+RhzO/3UGZmj+0vkLa8IVpOAZWT/HljAOxLdUMciqXow8REFu1QxidSryNq15+A+2EF977vS
 0y2/i0BaknNMIe26GQGtHsX9wWGe15Su8E5sEvDShiqT+JSpG8oVcROpRrEcSYMYcrycJKwa8wO
 x91UrFxYdK7cpxCKSXcL8mKY1Gx7ASRPrfMnOgo4O6MLdkssOsluCwB8RE+MKgSfk7ir+B5z4Zi
 Bb50yYWX/QUyijXldc44l+G3lxjogzLkCVZE27wj40Fj9/5wF773wY/rMQT4Bso2LQk8kuczcGt
 oqZ44UKmxprc/HH3/ojMbWToBGQYLTLbdsZxxbFDpN2OgKLfd0cxtkH9GH0KxnuNm8kvTnJ3mZT
 BvUSSy8z6Aw1lQWBnGQ==
X-Proofpoint-ORIG-GUID: VoSDa3sY3E-UZKdML_c7-mS1f8JHDSAF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050001
X-Rspamd-Queue-Id: 667154C5545
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
	TAGGED_FROM(0.00)[bounces-31973-lists,linux-renesas-soc=lfdr.de];
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 18 +++++++++++++-----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e96a12ff2d31..2ac64495cdb7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10683,7 +10683,7 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
 		return;
 	}
 
-	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
+	acrtc = to_amdgpu_crtc(crtc_state->base.crtc);
 	if (!acrtc) {
 		drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
 		kfree(wb_info);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
index 110f0173eee6..fdc3da40452f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
@@ -169,7 +169,6 @@ static const struct drm_encoder_helper_funcs amdgpu_dm_wb_encoder_helper_funcs =
 
 static const struct drm_connector_funcs amdgpu_dm_wb_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = amdgpu_dm_connector_funcs_reset,
 	.atomic_duplicate_state = amdgpu_dm_connector_atomic_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -188,17 +187,26 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
 	struct dc *dc = dm->dc;
 	struct dc_link *link = dc_get_link_at_index(dc, link_index);
 	int res = 0;
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&dm->adev->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &amdgpu_dm_wb_encoder_helper_funcs);
+
+	encoder->possible_crtcs = amdgpu_dm_get_encoder_crtc_mask(dm->adev);
 
 	wbcon->link = link;
 
 	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
 
-	res = drm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
+	res = drmm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
 					    &amdgpu_dm_wb_connector_funcs,
-					    &amdgpu_dm_wb_encoder_helper_funcs,
+					    encoder,
 					    amdgpu_dm_wb_formats,
-					    ARRAY_SIZE(amdgpu_dm_wb_formats),
-					    amdgpu_dm_get_encoder_crtc_mask(dm->adev));
+					    ARRAY_SIZE(amdgpu_dm_wb_formats));
 
 	if (res)
 		return res;

-- 
2.47.3


