Return-Path: <linux-renesas-soc+bounces-32100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 52PdKQpn+mnwOgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 23:54:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A454D41B5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 23:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A81130356E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 21:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BEB44A1393;
	Tue,  5 May 2026 21:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7qXeu7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iBz6nFJG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A934963A5
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 21:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017803; cv=pass; b=rpeXTM9BkALJUP0iF3JsP27Mg+mZIFcHJhityIGhGIeFe0tBCic2RANrWpelRA1BA7XLK52xI6AhHaGlVDYD8T0qNTsFUrI6t/BOOhNZ+auX900x2D2tnWK9/sDAiKzSj/41T3RNFNx3qGntLGnW85ZyLR6Kj2gQuDtWKz6+rRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017803; c=relaxed/simple;
	bh=Thv4BPtf8cWtZMW8SrrSWbJdMlVqenK6asKH6VRaP9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c18VZvcjxlLkgxgoo3NzzOCSesKSJxRiH3GdsjN3XLKZ9G3srivW+2+FXRlsdLC2pjuqZY3NWDDDZhxkLTPIxG3laiB4dOVD7By0ewUemhu/o+LCkfaQ/cikGBsTe6xSaCGjGnpPDGncXFXkJcP2+Yks74KPsv3NAiYmd7muya0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7qXeu7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBz6nFJG; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645FwO7F2859195
	for <linux-renesas-soc@vger.kernel.org>; Tue, 5 May 2026 21:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=GWoubTXPQdVwM4tS4Rj7Dbfl7e/Ff9zwszps/EZhuKk=; b=m7
	qXeu7SooJdrbzx+ez3ztpKc8cu4TsY67cSrZycclEIrhwsW0CPKHbigfETGzDAPo
	tDqs6F0tR7ATCG+ZsPLPnFrmhwwUQ/ifgBs/SMVU2SUCt1oT+iq91dPTztQBzWZv
	JR3GwgS4ydL6REZZuzArZCL4ngfEDkhvxYDX/IRdqIHX8xdU9Ew/yhHUcUE4gK/4
	mx2taIugSHfLnsEH9EFhiShR8bnIVERJvLpIUpS6QKzBTrep28ncwwO6kesUM+sa
	6bdttxzy5hSDRCGFKJheAH2SKwfus8FipmeSM3biuol0d3GkT9OdoAe5U4gU3Fta
	mFB81t83iwxS1HHbUXLw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dye0ajw6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 21:50:00 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-475f6d0de69so7116836b6e.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 14:50:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778017800; cv=none;
        d=google.com; s=arc-20240605;
        b=Ed5Bb7i66hdbvzlua+BpqDNV0V0TMQbLuR6WiJSccHxnNApYgKDpyjJ5ebiblyPZ46
         /8rBW6yR9zZPAiNSNhprrnZDExgzzj5atQYZT2Q9Z3qXr+QoM9m98NTggU7PTdTQ9TdZ
         SfD1Wf2bQl/YJ9A6lw6dgiwWd2+hLpE+Trzmao8fGqRDyZA+Vb+OWGcFcWVceT6GEUEQ
         glu+oZSukRolaHWPi7S7+RpNJNLLaVc88Hzbn8YvhEqpZ0oPbVfi4PinP8PjTlsE8H/b
         pv4Yl6q0UrdiHmHswUP5YVu7f7NmfLTWmSO5NT4R6MAQEdEvB9zUY/nWwuc11hQS+AJc
         b2sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=GWoubTXPQdVwM4tS4Rj7Dbfl7e/Ff9zwszps/EZhuKk=;
        fh=GZ+iGB4w9VCYXJIzwcogSrPsCcNt3aV0IRWg202I1CI=;
        b=ckTKhB8V72hvJXPCPjM7ZJinDV/03Hfyanfysgj4yV8u+eiFKDbxfiI0Knax8okDf8
         0m0VFxeMEr96YNhB9ppiUs0NxgJyNnIHfO5cRQPmVP4NHgyjxvcMPW9f+hUIvO8PaDRA
         kaKfM44wKA5SS7rkthlamT90dyZ9k+k2IreMjUYt2iA0Y7clzUmKpcMKMjFIhsOThfsg
         QUJZjVXXA/LdHGOU9CJSBDXM8VKYn2GjVSrIESsENuuVD/Qk+ery3GHxIewGZKfxMsyX
         P8QqUknH+aIkKa+qUs7dXaei0WFlz+qeGP/6eTDppoqswB84KUw8bENMJ7MZLp3B6Pnz
         h5fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778017800; x=1778622600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GWoubTXPQdVwM4tS4Rj7Dbfl7e/Ff9zwszps/EZhuKk=;
        b=iBz6nFJGgzEE568ON5pxDc32FiPjU1uczwr2N7F7gBThgu1Rbfb3Wy1uQQhTxGnMzC
         Zm31j+m5tm8KtRiw4811WbLQq+Co4m9PqXySI+sCpadRwLGMgQPpgVhDSADBIeK2BbtA
         4xqJrJ96YcMiPR1FcVAvu/Q/ubra5+NqBRHGa2x69OcntXyqQZcPWRiK5fn5nQHWFOgI
         26v5M3FAgzI108T07Aef0o6xAjgSmgJwN2PmFcerhGnhJYkLbwHxPJpKOB6aWxtQkSGk
         ZkX3O661SRAWdu3hxVs2QNCa4iYNau4LXi0bQD5IktrwjyBeXJ0pYl3tM7AIobT6a7fl
         hWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017800; x=1778622600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWoubTXPQdVwM4tS4Rj7Dbfl7e/Ff9zwszps/EZhuKk=;
        b=TFmSrkq9T7QmXATj7kynoeC0ovR6xjYYkigf4ZKzQUlcJPw01E12s0VHI6V2CRHVEM
         jGoKunLTX3ofv32bLSXEfoj+lrPK6mE4xAa606On4oPVRBN+aRhIM2h3jq6MmQPRohIv
         N02z2TgMNEVREhIhd7+0Qty9CYGvI+rGezOuNbiUxLvo0vhESzshsq7Sl2SNyaNuA8OM
         MS8gMPcLJROt29wG8uDdqv8TG1IY76B85ygdmLvhZRx6VCl+YACHrRRN5yOVJONo+GTO
         Yw+mtvb7srSMnq9OxRAOMG0Yi5B9B+1h1N5B4F5WCbDOF+SvlM5TbQ4Hdqw2jwwf8fzb
         A1uw==
X-Forwarded-Encrypted: i=1; AFNElJ8hxqlIIq2OqRZ6SPV/2hYTBDAt9fOSKojk0PNf9qkeF7BJmv6LgGPZrWuqJzHQ5sOUL7rf7chag6Ua3ly0HulQGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy70s5jBagZEdgVxXR4MaOwiyFaVwnBHAl2oqbVcqP1aDAHtrSq
	ICteLMxRS+4MCEt+7GI2eMKdwKotZ11fSCsl4UTvr6vMHPRE2pg2wnpRBwaF9LKrtwJ4wghC8O0
	thV0ybiWeH/BZQczicmzrLS3fTk4b4K/IZ46haw0hNqtSEVj3GMSUSEK55Gyexp9sJcrLcvCT9g
	S5o+99iT7e8iVzzcuTp2ZDJJNQL9x65Sut0vkSa9ORL+tcgJlD
X-Gm-Gg: AeBDiesZlbRfArGale8rAUZMxQWYjrJlc2vaaW2gxL4L/g2jvX+OTKyYsmTGUcpnxoh
	PHTj8TYvkp8cJOWfuO6Tjdy0yegwLF+CR0jTjcxEhMP3FSDepbS1nTCiot039ti/1FHNbfakj5v
	KESV0tdQAyRzC0sbcSKU1BV7E/x00ELSxpf3eLKKQ+F6CShbG+henvwXPkhuY4IhWYSYQP02j1N
	q9ydaULRHMOxQEtvKl5J/uhqEcWtxjBkjn+xciR+heoaWtz
X-Received: by 2002:a05:6808:d52:b0:467:9ca:4b8a with SMTP id 5614622812f47-4804221828cmr643128b6e.11.1778017799551;
        Tue, 05 May 2026 14:49:59 -0700 (PDT)
X-Received: by 2002:a05:6808:d52:b0:467:9ca:4b8a with SMTP id
 5614622812f47-4804221828cmr643081b6e.11.1778017798961; Tue, 05 May 2026
 14:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com> <20260505-wb-drop-encoder-v5-1-42567b7c7af2@oss.qualcomm.com>
In-Reply-To: <20260505-wb-drop-encoder-v5-1-42567b7c7af2@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 5 May 2026 14:49:47 -0700
X-Gm-Features: AVHnY4LH0uDMjgYOgFKujr3D57r6UVTyvfwJmoAF1iOOVmgpBbGDoiGs-TovmEk
Message-ID: <CACSVV00TsXn=yx2UeGpxvCWRkSdj0=_=3_s01wCaO1RDH8t_vA@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] drm/msm/dpu: don't mix devm and drmm functions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDIxMiBTYWx0ZWRfX1mnFrwaoemoT
 ocwBMkEcEZun65kB0/wO5dosvnTpaupmtwOJ+lqQDSLJV/OmolnT8UczLFMlcHqLwrebU0vFakN
 2Rogm2jZeOSOlqy5QIabZMmDyHaRmExegaM0hxtM/Qr19SFi6UAJUwBfFNvZWjH/QPUxBWh1fyg
 Z8cVxjXerqRcBKx9l/LmspqKM7h7T+QQHRNe8mTHN4JBbYPzMX2yAJgnqH0fAhrUSmMI+4k5RMt
 9nNipdfzOLKWBJyakvcX5w8UbTyhio+6LGF/rEw+vQzBKreDeQlEAB4YNEfzIsXpFhrTaE6Dcmc
 ivJ8L4ibXzcdUP7j+84TKsetNWb161jXlAF7CoLNxuG8TDm/wSTyng+3myI0k1HDOEKStzjFQQ5
 wgv2YWZQlYL7739mMwwpVszfFvnIl2S3LS8Rn1ixP9Oq6MiylHNBouMx3VlunqEZzMeZ5HX9wZg
 SlAh9a06KcxHpXtXmPw==
X-Authority-Analysis: v=2.4 cv=Wtkb99fv c=1 sm=1 tr=0 ts=69fa6608 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=lAOjoZoF1AEScRdHVYcA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: Gs344-zHrBIje4SLyIpEZtesQjYqGNlo
X-Proofpoint-ORIG-GUID: Gs344-zHrBIje4SLyIpEZtesQjYqGNlo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1011
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050212
X-Rspamd-Queue-Id: 03A454D41B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32100-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, May 4, 2026 at 5:25=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Mixing devm and drmm functions will result in a use-after-free on msm
> driver teardown if userspace keeps a reference on the drm device:
> The WB connector data will be destroyed because of the use of
> devm_kzalloc()), while the usersoace still can try interacting with the
> WB connector (which uses drmm_ functions).
>
> Change dpu_writeback_init() to use drmm_.

From [1] it doesn't sound like userspace holding the drm device open
is the issue (if that were possible, it seems like it would go badly),
but rather the order of managed cleanup?

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
/commit/drivers/gpu/drm/xe/xe_hwmon.c?id=3D3a13c2de442d6bfaef9c102cd1092e6c=
ae22b753

> Fixes: 0b37ac63fc9d ("drm/msm/dpu: use drmm_writeback_connector_init()")
> Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Closes: https://lore.kernel.org/r/78c764b8-44cf-4db5-88e7-807a85954518@wa=
nadoo.fr
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_writeback.c
> index 7545c0293efb..6f2370c9dd98 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -5,6 +5,7 @@
>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_framebuffer.h>
> +#include <drm/drm_managed.h>
>
>  #include "dpu_writeback.h"
>
> @@ -125,7 +126,7 @@ int dpu_writeback_init(struct drm_device *dev, struct=
 drm_encoder *enc,
>         struct dpu_wb_connector *dpu_wb_conn;
>         int rc =3D 0;
>
> -       dpu_wb_conn =3D devm_kzalloc(dev->dev, sizeof(*dpu_wb_conn), GFP_=
KERNEL);
> +       dpu_wb_conn =3D drmm_kzalloc(dev, sizeof(*dpu_wb_conn), GFP_KERNE=
L);
>         if (!dpu_wb_conn)
>                 return -ENOMEM;
>
>
> --
> 2.47.3
>

