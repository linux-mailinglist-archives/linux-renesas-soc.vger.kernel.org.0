Return-Path: <linux-renesas-soc+bounces-31564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KK3AQcA6mkHrAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 13:18:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99120451311
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 13:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78CE9305679F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 11:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F303E6DEC;
	Thu, 23 Apr 2026 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AcKEJtIy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DLxbRHvO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DAC3E5ECF
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 11:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776942996; cv=none; b=kThCym8pTNHd2G670sDtfKg1v7KMjx8GE4Du2Mb1aNzBiUPbg4JbpuItVLMovISjXokE3G6IHwxi9LU7jVqVMxEz2yHP1BoLnE2+Ou+TJbRQz1vG9A/QpQjN10+FwDsk0QGz6MKI4aIyduySqTQcMyWrJt3MzAv6gmTs+sbgNNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776942996; c=relaxed/simple;
	bh=QdDejc48UM8nlCGxSIpUbXieNxzvddb1KXMnMSUPALA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tcijfF6FdA5SeuwmNChbm8CaoxUqa1R4mRaaZu2sk1hmKy3cHj0/+lTXn3PY7gVQ7UAe4RLR2vIQSWihBg8K5y9qSRHAOhSWnMFCHtBWIArQQtwlVGL/+631mDsfUeQoYsXmNV1IOqz00InrazBOg4dcry/xSpaoQmwNNtZlkQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AcKEJtIy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DLxbRHvO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u4gq3769021
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 11:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6EkrSS+3VgEY8uSY9jkXaDneMR0EApwn3j4Pyi4BsvM=; b=AcKEJtIylYjWGznS
	kQ2pCo51oFxbcCiuMYCIK8i+1xfPfG3bN+IjtuUnMIMBeyLUxvz+URxenh81SNeL
	QSrlcI2rv3+NKbKdrUfGjQTOs7mAF3dZIIxwitR9aEVxbufM1L6I1j8wJdrg4oTd
	tqgO+OcoBuEaNS7dej6fedA6eped242wzXu4psRkioTxUrCADqt5ZEBL/2OclNU+
	eqG9Z/k4loLPOTy2YgDl6jSc+K1aORFvlMfAwNGvgDJgsqyO1npP0w81LiOXanXk
	IPsWI68+JM0jCwv02C8l/wgAfVvDxjbNPG3cP+qnuivnGA+AroySVHWeBrphBHHQ
	7fKv1A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hq3j2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 11:16:34 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9539bc7e2d0so10505712241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Apr 2026 04:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776942994; x=1777547794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6EkrSS+3VgEY8uSY9jkXaDneMR0EApwn3j4Pyi4BsvM=;
        b=DLxbRHvOsXaUy6FzcjcDMeUZTBvEDxBF0IVwlxx2whT0GCdg9wKNPvlVCCMtNErZEy
         6fXCyt2193r3wH6yPYsb61crjZXw07LXEhmiwLoxhVtDVIUTBFumX8oBhu/bx1AhiXq1
         ncW0O+B/bn4+NUdkh+6IujV16IffYy7FYhC50iYVDeK9ghwM/XWBdJjIQbEIPhk2VrUn
         pumd6kB5SoDM+uTmKQ+JGPWsCJu4NPKPElnwDqyLhozf28DzqJk2nKscXQBKDTcVeLiw
         jJ3OgjuFqeOvbz7oSK0hV9H5PDUxtpHHCZWXxY5K8mflzsw3UQ4pQyfFit4R4zlKHpXc
         6qaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776942994; x=1777547794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6EkrSS+3VgEY8uSY9jkXaDneMR0EApwn3j4Pyi4BsvM=;
        b=jvH3KTZhL9JH35kpqgPzUV92A9V6PAPTKHK20cl7WAOkcidgkTbum5ZpvbXtDLhaY2
         36oBjLGLqSBSLAf8jayZMKZuwzMh4DBmNtdpsxx9xjNst70NY1v9JEGSEjhrd60404Ul
         5Jenp1gYqXwHdUwTEaD3wyvUbpfhNnh9w6Jxn/Cgtvk56uqt11xcgm8q8dfEpNQb99sW
         TpECwN+jV97e5yv/g+9bO/zfBu4/ult0Bc50PdLbPgvXMSPmR37bx02nePx066ymss8p
         e6A4r8P9Q9So3rhtQmy+MgL2xIshUlYu3TWlh9uq3ztXfCUw9DUqs8NNYT5pbNu5CV2V
         DWWw==
X-Forwarded-Encrypted: i=1; AFNElJ/R+9kbTi9ZUF0nophO4v8qpw3GZ8Z37xpLQKYm+/DY2SqQdArlpnjklEdbP5TJZGst0GjKdSBNTP5Yc4o+xVXeXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6nnEeZW8/SDCKuY8zWtSfXNmmwr34g2XaPS1cVKQ0M/n/ts4l
	X8klzNjno6bD3WBLICTE0dHWuVxYRmR7Ns6QQGCBAgPqNNr2FQnua/rQuNxXmG7aeSmI7XWw6Ev
	Y1so/7ceI14F0t4XVLzadz0ZJY4WOKzNSfW8qF7xt4I4gm/qwU+esjb6QFCPVqZ989G+8xRnD3w
	==
X-Gm-Gg: AeBDiet6dUYnVXxWqd/fyMXV333KCY3cofaDtKXuJrDKzB5wsl6/6rMsBnXoXCXRs5j
	xTjZJcRrJI2c54HZ43vBnJ+eyz3HZA1xfsiGIvWseYQdX2X0hpFvSgLyQ8PqfQcjCxwlWDm5hm0
	lGhGPw43e2h/YPA7DDPvL3vz0d0MoSlrWAj4ua71pdxyMv86Z7SwQsTVXDZItqksY4XSN/NqQ8P
	oJ+QnKL6lsPksZkf8EZzdn0ur4un7KMfFEjpCRH/NVYruLccnLzOuMc2EZhBcPWnwSOl/6/TH8B
	k4T0q8qzuJuGDY2If7F7A8u5oor0870iSrzjNRiMMShaZvn4qnm3sbNIc2qXe86T3DX+FnNH7Iw
	DLpYmOz3zsc4R2qollopLbuOtm6hbaIBI7d21ERbs364G/BL2rI+8HX+fcPoR3PJ13pDcYrIFAy
	g/sP8urLfHuq70koVG4DQ=
X-Received: by 2002:a05:6102:689c:b0:609:444:e4be with SMTP id ada2fe7eead31-616fe256d4cmr9351153137.18.1776942993787;
        Thu, 23 Apr 2026 04:16:33 -0700 (PDT)
X-Received: by 2002:a05:6102:689c:b0:609:444:e4be with SMTP id ada2fe7eead31-616fe256d4cmr9351131137.18.1776942993344;
        Thu, 23 Apr 2026 04:16:33 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a166sm51247890f8f.19.2026.04.23.04.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:16:32 -0700 (PDT)
Message-ID: <c2725698-a76a-4930-ba02-5ef656b3239f@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:16:31 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] Add MTU3 for RZ/T2H and RZ/N2H
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExMiBTYWx0ZWRfX5oQGRMbTUcbt
 1/ozo0SHpOFwuJpEZ1r7J2FktMh5lOdPp2Os1N0wMRvYUF5JDv6eQgjyqRx3HaX0O+zTPU15/zB
 utXpudFc9Q8yueh10P5ZolZyGDbf4Q+O1T9UUgVNkKJpi7Qe71+y6+N+tMz6Rjy9TPC6hvM4fjq
 Qjrht56vTIxMggvua9uwi55Hm6mdR9hFzEAD0tFdFfnGu+CvkIaririMDXfiVpHsC9PdKWK7IfD
 v7WwXKlRIIU/czEMpAARHDyf3zec1PIe42jkY0Ixgi/k91HyoRI4F8Pg3Y1Pj/k/zg+qJrOvEuR
 y5du4CIHDGYxCArQgMXYO72QLwkyFfp1SHVa5GN5CkGXr/2+Qes8XfitD8E4ocrOsA934e2Qjvg
 KCuVD+AzIMy+rve/JGvrJaf8lSxRFVRb3MJ3sglgE2k4li4swLo4TGrZS+G+0/a5tD9gf0g+fHN
 OCyvwZp3Xmk158OkIEA==
X-Proofpoint-ORIG-GUID: c5viMYceCpCr9gsqEttfvy8uLdmUUcfS
X-Proofpoint-GUID: c5viMYceCpCr9gsqEttfvy8uLdmUUcfS
X-Authority-Analysis: v=2.4 cv=TJt1jVla c=1 sm=1 tr=0 ts=69e9ff92 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=DZ5GKLsTfbtHXbNd-uAA:9
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230112
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31564-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[renesas.com,bp.renesas.com,kernel.org,glider.be,gmail.com,baylibre.com,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 99120451311
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 18:35, Cosmin Tanislav wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs have an MTU3
> block. Add support for them and fix the non-existing TCIU8 interrupt.
> 
> V2:
>   * reword to mention that TCIU8 used to exist
>   * squash "move required resets to conditional" into
>     "document RZ/{T2H,N2H}"
>   * disable the resets in the else branch of the condition
> 
> Cosmin Tanislav (10):
>    clk: renesas: r9a09g077: add MTU3 module clock
>    mfd: rz-mtu3: use device-managed reset deassert
>    mfd: rz-mtu3: use device-managed mfd_add_devices()
>    mfd: rz-mtu3: store &pdev->dev in local variable
>    mfd: rz-mtu3: make reset optional
>    dt-bindings: timer: renesas,rz-mtu3: remove TCIU8 interrupt
>    dt-bindings: timer: renesas,rz-mtu3: document RZ/{T2H,N2H}

Applied patches 6 and 7

Thanks



