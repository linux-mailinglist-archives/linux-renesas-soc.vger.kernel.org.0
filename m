Return-Path: <linux-renesas-soc+bounces-33924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KYKzBiQQLGq2KgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 15:56:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C1767A02F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 15:56:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IlgLuP5e;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d87xWlHX;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A609C3010642
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 13:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39CD372064;
	Fri, 12 Jun 2026 13:56:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4ED366066
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 13:56:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781272589; cv=none; b=NpBF50TpIkS80QpwiQ+NOA/MPw5AoakKEE9O8nMmsaAOoA5zoZAkFHoBPcEWf4eW02rSFoPC4j2VkXaHjQqc+wYnLh4aMMiDZcCG4q7DEH8/KvFrJuQ1AoI6UfvmtRmCtrG84r8J3xIodCFysZe+ZskYT0sYFZuwSQxb+To64ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781272589; c=relaxed/simple;
	bh=MhfrCz/ETu0XHtGYH5FvULEzWeShS1i9c1nXgnlW71A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCTuAFaEJG5P6oVa63aTdkHkVPpfhegyRYFmegLmxnORltM5zDCuQqEjlqsmA1GuLQU7CjEy9c3UOhUKfIX4V4ZTkmVIcBkSWNiWl1HRVZLoNnE0Kw0WRumPmUc9rkUAIvJ9F/MDYgK8ORTu+fmHEnagp+tlaAXrdVSrzxmu/KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IlgLuP5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d87xWlHX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CCj5Oo3716451
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 13:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lj9iP4K0GcPnNCW95XMo8tVN
	jOPr4RfYCBOREwlPyGg=; b=IlgLuP5epKG7Z5khBWGVWey9TcvkzndL34gn+BRL
	wbvqAp7hbNbX81s1YbPiX7vmpFIfJH+h7VAPVJq4p8ifKI3T5XT8RBMqYSMstXHS
	ZChjsp16KOYilHe2GvI93MdroXzY/O0MsPLRyw1uUu8BkyiSBOubv5PValHc2rCu
	aD30yxKF5QIbdvvvpgXVXFGP+Kb6MblChW4vCdglMMF8cogrY5+BgQ+BHTAvedsI
	e+QC6dyVvfIPdXUD0PWalBxRuJ1SMovpDQW7z3K5saTUUgq4JePSDhT1ohia1Dtx
	SQm2OOijXfcwoGbdikDVHlcXCHeKI1orwQMKGk7bPczKBQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd3n7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 13:56:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915c1997732so237642285a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 06:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781272584; x=1781877384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lj9iP4K0GcPnNCW95XMo8tVNjOPr4RfYCBOREwlPyGg=;
        b=d87xWlHXqbWlLWRq6/dh+q3opbfryMpV7C7b4giHZChI5vUyX1bwbLoqZ9zcqwkKf8
         DZsukyh1IewkjOU8GrqzQW0cWMWWUdo63aqBM051WN/nXYkvpnNp6n2PtAtz5gAysu16
         ds2ZWqDdS0UkSyq+wgceXJhSl1t/S/lxAre6YOAbHmHV5aKll0hwtn3aRildktXpph0x
         O9eHIarYCBfn2xOP9XPmejFDfXJNBoXGXL9xbQ2aWw8wJepSRBsfAT4D5xhZ1DBB5+y+
         y8xW2TzCTpo8VO8AzqlPHeC5ibqsC9e7PoWzjiH3138H7JKFN7ZTB6iJnUKOdjyw3v4n
         VArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781272584; x=1781877384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lj9iP4K0GcPnNCW95XMo8tVNjOPr4RfYCBOREwlPyGg=;
        b=RN3K18sS+SWWo95LRbxf6i2RjsxGJE6QVyZQQ7tg31Nb5GzOe9K/1Cdht2SdtxbzyV
         A/jTT6sUhm4lAgOvQzXW6b08y0BpQO/TLSSiFTnP3T2ll47QfGGp+3dJMs7KeuaUmxd6
         njfKQPhcSUAJhxTmNEeBDsZnkOOzidyk5oUjm25TadKnCT/kgw2BM0Cwqr3M8E3Pclya
         hyyEqLlaKbyHku/XccUtVaIX2OaGXI/Scm7L5mUWnlSyui5bCxMxCc6fgF0BN6uHaRYz
         EvGoC4pNEB1y1uA8vqPHg2C1M9wXuArL7cdwi/e+bEA4ofrvbPhC4rpb6v7DusVwuXaF
         pjjw==
X-Forwarded-Encrypted: i=1; AFNElJ8s+vBQi9KxN1kNUkHKLfuciuMj/sXMjjdJM+whc0oe8DPzEamCYTdLBEQcarQpZXJF8BevkDYuJz/x9Dxx7JEkaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn57AUqeig2jNE2JGk45i7GHa9tNuXl16UBOEz9pelAnwP9vvs
	Ya3qPTlgrax4xMqcy3uiqtRLDU0hy+8dfW1CCv5xd3eNN0ha59PgVZXrZSYg2souNjnEfBaehCv
	HSkGziwXttANlwFFppPLxZWPQ0X+SYuWPAEDZSm1UG7gVdfE8xiCqKXmbEID2+jX7bPks4powwQ
	==
X-Gm-Gg: Acq92OECSKHfPp9ZRnXThUUl4jHwOx0hF6dZJJsMP3KNp0a7UP4SDLw+W06oD6RHGiv
	3j3kzXC4FBeHwbwJZyIqXgkRhEKvgs32+M8dBUgfVAfuHJOVUoiHMrJ1S7WGDL/I5q3eUce+NkK
	+C2nwFPUZ9TOoMIm/qUSbaoGHZfCzf0qrSzx1hiyR9YvWqNthJpiAqbiKFY0LzKN8aJ7mEBR3mX
	QE90AhCOgv/I3emFhzzGBzf11ApxH86s3lGdPdocYm19mzrSYOSSa+bMAQoEL3xyUazwJCUcQ08
	O9wJsyBuevUK8u+ju9GDyngyCxATmN0w9omXll8CeQdfQieBohTyWThINpq0VnZxG4An0pxRQ8t
	g6l5cLU6XIwU2ItVJc3tCeyLSEAh0/tId2koqia25WVIxH/CWNg+wycQCZcJn247x8FQDSe7U0e
	TmDoZYoKdjpmI31zbGxhQ5J0HnlY3L3g7b8nE=
X-Received: by 2002:a05:620a:2411:10b0:915:75ba:179e with SMTP id af79cd13be357-9161bc9f023mr286845385a.30.1781272583876;
        Fri, 12 Jun 2026 06:56:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2411:10b0:915:75ba:179e with SMTP id af79cd13be357-9161bc9f023mr286837985a.30.1781272583368;
        Fri, 12 Jun 2026 06:56:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b4869sm563523e87.75.2026.06.12.06.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:56:22 -0700 (PDT)
Date: Fri, 12 Jun 2026 16:56:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alex Hung <alex.hung@amd.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 2/8] drm/amd/display: use
 drmm_writeback_connector_init()
Message-ID: <kkfb5lvudgo3curnoakp3qre7pofaobaxynz7qhrn6jy2ll55f@clhfe664z5ci>
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
 <20260505-wb-drop-encoder-v5-2-42567b7c7af2@oss.qualcomm.com>
 <27db214f-b57b-45ab-8deb-da2aa8efb9d7@amd.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27db214f-b57b-45ab-8deb-da2aa8efb9d7@amd.com>
X-Proofpoint-ORIG-GUID: t_Gi-SCU2g6amLQlBPPARizz_WiLjUO9
X-Proofpoint-GUID: t_Gi-SCU2g6amLQlBPPARizz_WiLjUO9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDEyNyBTYWx0ZWRfXzGaUE/ellmZf
 vnx0uOvBcNwdcXZ2jNMn2xAgRc6xqY+CZ0LvfBs1YXmXnXT3bzudKwljBqpeZq4gbMZdaWERMao
 KyrwTkYOLGttmhE9t1gl39eCASVJkXzW4/9Hus1EUcBXeQj0Q10njAQps9wYRXPWgcdcweybbyY
 CcgaqMwssfslUUBi/qKwnf0Q5zDmS83OYagLAPFesUsybU+rySNiC6XqM9+4NhG1zBsbKfXDSFu
 9n+QUbQQJb5huH6zn50DfH7g3o8j9reBxTuD+FsnMtJmAz0RTrAFSr3YY9ucxCPeOmfNX9WYaUe
 in5rXqLLa1Ras4wpTt1KIK/ONLPBPnAx8QWDMFNK31BLTDS0juPyqH/rgl8IKoPOotCyXxDSRnL
 nArAqR+vDR/7BgqXwtCSYY9qFHFZ1v7rE5X5XCg/yoCAAJsaJhtxXRkgM1+L2PZwECCcDPyXLa7
 eMeD5VqGpUZ4lx02k9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDEyNyBTYWx0ZWRfX1xLmXX0/hJjA
 GKPzTq7ZMqHGuUIrFJ3juUR7FMhjJLOw4aenxOoJ1aRsogFnts00V0HfRIp8v01rW5vXdL+7utq
 b+vHoRTM8cEKSTPFFlJHE9N/OYI3+/Y=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2c1009 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=P-IC7800AAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=t-2y4xJzw7g1bk7x_BQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120127
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33924-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alex.hung@amd.com,m:jani.nikula@linux.intel.com,m:suraj.kandpal@intel.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:christophe.jaillet@wanadoo.fr,m:jesszhan0024@gmail.com,m:louis.chauvet@bootlin.com,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,
 m:linux-renesas-soc@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,bootlin.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B0C1767A02F

On Tue, May 26, 2026 at 12:46:30PM -0600, Alex Hung wrote:
> Will allocating wbcon with drmm_kzalloc before calling
> amdgpu_dm_wb_connector_init be more memory-safe as below?

Sorry, it took me a while. Yes, it seems to be a correct idea. I'll
implement it slightly differently.

> 
> 
> @@ -5790,7 +5791,8 @@ static int amdgpu_dm_initialize_drm_device(struct
> amdgpu_device *adev)
>  		link = dc_get_link_at_index(dm->dc, i);
> 
>  		if (link->connector_signal == SIGNAL_TYPE_VIRTUAL) {
> -			struct amdgpu_dm_wb_connector *wbcon = kzalloc_obj(*wbcon);
> +			struct amdgpu_dm_wb_connector *wbcon =
> +				drmm_kzalloc(adev_to_drm(adev), sizeof(*wbcon), GFP_KERNEL);
> 
>  			if (!wbcon) {
>  				drm_err(adev_to_drm(adev), "KMS: Failed to allocate writeback
> connector\n");
> @@ -5799,7 +5801,6 @@ static int amdgpu_dm_initialize_drm_device(struct
> amdgpu_device *adev)
> 
>  			if (amdgpu_dm_wb_connector_init(dm, wbcon, i)) {
>  				drm_err(adev_to_drm(adev), "KMS: Failed to initialize writeback
> connector\n");
> -				kfree(wbcon);
>  				continue;
>  			}
> 
> On 5/4/26 18:24, Dmitry Baryshkov wrote:
> > The driver uses drm_writeback_connector_init() instead of its drmm
> > counterpart, but it doesn't perform the job queue cleanup (neither
> > manually nor by calling drm_writeback_connector_cleanup()). On the
> > contrary, the drmm_writeback_connector_init() function ensures the
> > proper cleanup of the job queue.
> > 
> > Use drmm_plain_encoder_alloc() to allocate simple encoder and
> > drmm_writeback_connector_init() in order to initialize writeback
> > connector instance.
> > 
> > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    |  2 +-
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 18 +++++++++++++-----
> >   2 files changed, 14 insertions(+), 6 deletions(-)

-- 
With best wishes
Dmitry

