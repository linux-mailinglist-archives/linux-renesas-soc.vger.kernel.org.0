Return-Path: <linux-renesas-soc+bounces-33954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d511K1NRLGpKPQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:34:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FE767BC4D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:34:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JDjJywkl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dBOxgsRF;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A2E33310958
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E866257845;
	Fri, 12 Jun 2026 18:30:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7536E397B15
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289032; cv=none; b=FuHt5VDdf2mp4pm4Sclm8Yy6x8xnHpoqvAbsIYuorDaMReLBcRHmY2j4RqtpHnH1b4mx+pVbPCVyREFgbbz7H71Rw0z44Bfu3F5EPFxlyUZZKUEZyYXZWwxIm88V38rbOtXYy4ChqzTIUxA0pHSbE3nWRHGsjqp9xbOpnulVXm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289032; c=relaxed/simple;
	bh=EekG2aEhKLuUzGk/MefJaYhFv2SLpgTabnBvDlYdrFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ulaH0hNYWVZcfm2S9EnBjokVI0zY+fSqf3a6Oes8a3Om5JSQO/IJnfhPK7i5QoPvQwx0D4qJvuOFRHC+KJeT9/5OAycdsZeNpaLSJfY2ovDjmhwxjjOn8fvtwxIpmvEel4RuMsass2f7N2iEWF5zpWSOA97GYkwNtopbhuBbWfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDjJywkl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBOxgsRF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGWavx020988
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QBJeYuGqe22P6k7nEfBN02fWJOuRECh3h974+RTUQts=; b=JDjJywkl573Oppgc
	a/m3TBe+6a2JfecT9b3uIzacmtAK1q8qhgZtpoimZPEHqTfkTmpmVogPPmbYys90
	cAwU+ANkYhc6AwLv7Pj3Ahz56Thyb+tH+qBa6uT/nEm32ARE/RlGwuSJ5Pdoa2ts
	P63Xf2JKBP6W12t4s6guCx1pTC0JZMeRAXjiw3M6Q6l5l8XPzmrA7p++0Qnjs/LO
	bvfOVyOu21xR7Avbo3pHgk+B/WgXUj8fx6YQy7EoFRZ3BkkfxkZhNgJgXqtfcb0E
	qrn8c7Aot/kKThewvIPHA97mqjq2zdeuZdMglDGJ8eSUA/tqJwHHG418RYVPp8QU
	tp/B8Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1cbmh0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:30:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91578c374easo228384885a.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 11:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781289030; x=1781893830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBJeYuGqe22P6k7nEfBN02fWJOuRECh3h974+RTUQts=;
        b=dBOxgsRFEtMqzytmCYEEgrmKyIdzSWs24D4+cQAGgjHTcUQzfJu1+h7GqjH6aoZFLK
         7IjdmOI8cX++8e3WY5yQviDcpn4ysdXyJkiFE7tO0fEIH1cAWD+KBtIbHpZa9sHFno0b
         u5DTGhHXC/Zr1cHt7ptFmvXJ0f+rTm+wdWFhWrT/HtHHy0t3nNLZqn3SYAqgtJmQeSLo
         1N3PnPtF2DCs/1HupghcrBy8ZTdre+Ie7BEgr/VChRm2xHdOPSIm5B8jqe4qkMggGFFV
         TCd8fMYXthpItPIRvdFRhoiRSW9/lIjuhs97Xon0POf22v/AP4R+3khT68C/KLGxo2iw
         k46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289030; x=1781893830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QBJeYuGqe22P6k7nEfBN02fWJOuRECh3h974+RTUQts=;
        b=aNtI5Fq8Eew0zXo2KPx5KAwOKf0Eo+5DDr5Qs+tLRhGbl2Ix9b/j1kUkxzBnAaiqmM
         NjE1ln+Dvt20DWlLf8k2dDpYlhfVj5P/gfbh13tLt753rLOJPPbY9X8QIGJyFOAFwmb8
         E+bNkhlwtbW4tzGlPhaZEcDyZ+g+rI2VByJW2QLOspRdvPv+EBHDR+QuUmACtHNVdkxq
         mDQYtbAoHD8oi2k7+xGWjjzWanflPM1r9/Aoxh/ttSESQ+Q7tTMy4EnKUdgby+lxVZWB
         v2ORkw0eJVDUcAy7SYCaWww2yOF2BS8PhMZcWAGKb4hszjYK+bshoDU/y5hu2qbIhlta
         TTIg==
X-Forwarded-Encrypted: i=1; AFNElJ8utPeUcvKxzaTfp3sDEuZb9pav/UpXIqM9+OrC7mrdEl5NrNNslZ7ipX05b8C0Ye6NEkPH4PF/jUMM8r8WEknKfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjI3tDU7jmr5Vq7gnzLGaxcxvQ+Ot+wrMaUeOA0c5xu6Y8JFLB
	hUVTIXmHse05mEwCJIIB08H9I6O/7Rgw0AdiUAIFnYUXv+39MyRDgiuyzsHoNSiUPDjGej2hasm
	XiOg5dO88lpvtPrbDeHP7lU9Jun7xsH0N72SR/1JCC4vFRb8nTaYzFdcXPT82Y3v1Qf2BVWfXiw
	==
X-Gm-Gg: Acq92OFRPJXOxWSx8BpRvuuSmJ/DDHXabxpJx7GeTkAyb0YzI+zcB6pLebV3dKPHqBd
	K6LipG5klSjcYsMGayKYBBlTOGkvTWvTBiIGH5zhyr5Nuy5EE+6wCEMB5ooRDYOTL1lN95M+ElN
	l9i8klWrriWFRSNVSQc1liiceQ+OBNuHaexk3P03Q7wzV4gFoV+ETn3hCj+23xkBcUzV0GU73c7
	d4CwPNSVwsWyOu6ueOKggf1MHrLH2v7HiY1bl9oHrPqFxfocA+tdAgqqyLfJKju5e++pjonFzXP
	H1Yo4K2lIFj0mXIIwX9VDBsmhrDL/s1pYiqiPCox1p+qb9QL0ncqObWna8eKCUl2rIHQMxx3Ws2
	eUH9HO1QaL3rDNG2l21wFOdheD6qVuTqwtfJI7Z53BQnicTvGcXVkpXve6njXrl3JGt3EzKsqkn
	mk+EK0xcMq4IwRX7ZX9/8xlvWdGQ8ScXcbSXY=
X-Received: by 2002:a05:620a:438e:b0:915:2b46:eec0 with SMTP id af79cd13be357-917efac52d5mr130402985a.11.1781289029668;
        Fri, 12 Jun 2026 11:30:29 -0700 (PDT)
X-Received: by 2002:a05:620a:438e:b0:915:2b46:eec0 with SMTP id af79cd13be357-917efac52d5mr130391585a.11.1781289029193;
        Fri, 12 Jun 2026 11:30:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161fefsm742173e87.8.2026.06.12.11.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:30:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 21:30:15 +0300
Subject: [PATCH v6 5/9] drm/mali: use drmm_writeback_connector_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-wb-drop-encoder-v6-5-9f3a54f81310@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2921;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EekG2aEhKLuUzGk/MefJaYhFv2SLpgTabnBvDlYdrFk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqLFA2/CqgW8HuyhGiu6mrDQOaZfrC3PXXYFzVN
 Bdfw2R9NwqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaixQNgAKCRCLPIo+Aiko
 1VKpCACMjzF++leJC1KZCPjZzLnYEoWLvNMfjha1yB3vZJDN+Gqn1YkZEgAJdK8jmV1tS9Rbjn4
 hGjhf1aRkpmRYnFRnV6o8k4JDpOyKwyVh4y/cx6eGcsJRA+wJ0s+JETrf9hdKaZ3b7NUiWYiYKC
 /4Elx9R41ZvK7BLWGrPzY7fn9MR2UmVTSulSrdceb0yoEapLzh1zKSNdtci5eKN3ejmx53WQIY1
 BWz66qjliBJVWDoYBfaYoKgEeAMDmoFgicMjFse8+5/M5vVq1bPshcIOVK0obX01xrE5zNmyZfZ
 UuQEkfMTQdZewSOEO6B0Dv6Knmy+ogKMWnz5CnhkeoTI0/rA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: GI1bmFEPUkA33Qv_zArqBMv0z7JOZ6Vp
X-Proofpoint-ORIG-GUID: GI1bmFEPUkA33Qv_zArqBMv0z7JOZ6Vp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfX1YBCQPzxwsy8
 T2LMGeWa2PSI49TqM5Yf2KXSesLrJfbQ46MDa+b1wQCa40JaGU2XDHqjKXgDR7kPOogWh7xQK68
 MzAoi6RxZVPXech+qG66R+bRV+hSqr0=
X-Authority-Analysis: v=2.4 cv=S57pBosP c=1 sm=1 tr=0 ts=6a2c5046 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=QyXUC8HyAAAA:8
 a=P-IC7800AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=rEXDA0v2x0ZtafRnR6sA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE3MyBTYWx0ZWRfX54Q5FmEzUigL
 UD+xq0r6FTRRV7HIaYonbR/ez46IThSdaz0Q0MuJoot32UVLcbOoCXG4CL/q240XsddDKD2zxhd
 E5CP8bI+IQCh/d8rAlS9GggSeYkCW4UoQsJUWz9ZNCcGHwxR3hmwNrHw7WHYGXTYwihmJgL9dwL
 ymTc7KAzQcXu5J9NQNQR0nUJ92EJvi+W7fw7pBiFo/lLSZ1TQs9fr0YTIxLCk7EZO1zwwa1Z0WO
 aRHmtD2aLHs81fOwimlXFvcrHBx5buy7nVDUfkzYLjqdU+xmw1ooTNDSUuhkbF8gCZl21QfFWD+
 eMF+v/H2ZZWxxFXjr924qJuBKdr83bHom9xQ+UXFqkoFxOCF4VA9O6EsuaSU6IOqlgLf9X7Q1s4
 ivdiL+QZTyMsTqJFQ7O0KhBeKjYkP3luNGUHYFeSyOwDlDtkShrJ6GSyGyFlWBwT8o+aOujPX3k
 i/Wkwntiai9jDCSRlBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120173
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33954-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,arm.com,ideasonboard.com,glider.be,raspberrypi.com];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:liviu.dudau@arm.com,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:suraj.kandpal@intel.com,m:louis.chauvet@bootlin.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,intel.com:email,arm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 05FE767BC4D

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
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/malidp_mw.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index f8be65119e3b..cfb7300e3e95 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -84,11 +84,6 @@ malidp_mw_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_connected;
 }
 
-static void malidp_mw_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-}
-
 static struct drm_connector_state *
 malidp_mw_connector_duplicate_state(struct drm_connector *connector)
 {
@@ -114,7 +109,6 @@ static const struct drm_connector_funcs malidp_mw_connector_funcs = {
 	.reset = malidp_mw_connector_reset,
 	.detect = malidp_mw_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = malidp_mw_connector_destroy,
 	.atomic_duplicate_state = malidp_mw_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
@@ -211,6 +205,7 @@ static u32 *get_writeback_formats(struct malidp_drm *malidp, int *n_formats)
 int malidp_mw_connector_init(struct drm_device *drm)
 {
 	struct malidp_drm *malidp = drm_to_malidp(drm);
+	struct drm_encoder *encoder;
 	u32 *formats;
 	int ret, n_formats;
 
@@ -224,11 +219,19 @@ int malidp_mw_connector_init(struct drm_device *drm)
 	if (!formats)
 		return -ENOMEM;
 
-	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
-					   &malidp_mw_connector_funcs,
-					   &malidp_mw_encoder_helper_funcs,
-					   formats, n_formats,
-					   1 << drm_crtc_index(&malidp->crtc));
+	encoder = drmm_plain_encoder_alloc(drm, NULL, DRM_MODE_ENCODER_VIRTUAL,
+					   NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &malidp_mw_encoder_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&malidp->crtc);
+
+	ret = drmm_writeback_connector_init(drm, &malidp->mw_connector,
+					    &malidp_mw_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	kfree(formats);
 	if (ret)
 		return ret;

-- 
2.47.3


