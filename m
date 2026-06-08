Return-Path: <linux-renesas-soc+bounces-33672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id efsrLdrKJmp9kgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 15:59:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6CA656DF7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 15:59:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HdTMgbz2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IEDB5c2v;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E8C530A6F3D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 13:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855DA3C37A9;
	Mon,  8 Jun 2026 13:55:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247733C455C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jun 2026 13:55:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926909; cv=none; b=uLRinq+Ch89iuIPUvpfsgwDTE+unnjbqdYbmVLpxziDNe5o5d//jUyfgtGtl8BiHBS6daoWmCU8JCMvTfZ3ge5h5bdNNuLmWOp3NghidlnQekClx/5KGu33b6180QjS450x1ufQj5cKYucf0LybGzs6Ys6GKatJ86ktOrcqMnz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926909; c=relaxed/simple;
	bh=NcitNjSkfQ4OyFqHaqu6E2atNqkTv+Y4lzGwlPttZho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HiuPEUv9AQPSH0yqzBuB82J1W0dsifXHrgSj8W77bMBRY4XSTL4QVe9ocwcYpDbxRKbFjfpDeleSasAGNbm7kC5diXmrHlhwacFL4EnTrSZDgY7ahgiVgg+oeS/syfp1Q5PZG+4wDNOU+D9AcI9LfMpn6ihGRUKbQuPzM7LK5jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HdTMgbz2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IEDB5c2v; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRKBF3682836
	for <linux-renesas-soc@vger.kernel.org>; Mon, 8 Jun 2026 13:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+q54AYUt4cvMAgQNkC220cQ0wa4ldXeQa80/giwooQ=; b=HdTMgbz2z5FgTqoL
	IfF56+idyL8eAcP8L6hXXn36m1WesYiTSoIIV33hhmXCc7Hlv1ZtLGhUk7EtnFKK
	H34ZGU4hXYs3zmFWAtfKObOliuNBwwkYNfeGJZeoT/R9R1e0V7bI6cq/EOHg/xi/
	/vmzCmOjypKO/DzYmTY58o+tbGsjMzZoxoFPGl2J4QlPpGNPrZGHLtMk2aBFErBN
	vBFTx4Lt0dGiAaBzc6xFt0nL833sR5dFPz0KghgP3N9zsn3ozbkqAFOx1+2n/aP9
	B1Y0vl/COLI0LN9Ep3/qH+i8pStCLeENyWIwSGd7OiBcmULPTnmnlTIU3EAhfTOB
	5y1fOQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enx2rrb3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 13:55:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5176cc5bf2aso57878731cf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 06:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926906; x=1781531706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+q54AYUt4cvMAgQNkC220cQ0wa4ldXeQa80/giwooQ=;
        b=IEDB5c2va4qQUGSJz3M/oNnLjLotH/FA+/q8pKqxO/HUwU5beeaaql+1CE3cy0XjCq
         wr/MHwhGh7jlalAZZI02QXsmBCSUBmwTurkRzIbjCfdpAj841W+5DHDCuE1blxQesxql
         J7rv8uAqqNJXp1A2iu6iwQxQHAnsEum+Z1UzYVqzvsT70luNen18nHP3SyaMbLO5WA1q
         qfNNBAKxtlDpmk6xYv8EOKFcI3GNrXsLBG28F/AMlqKttGBzI8HoPad8S9nVu1Yh+Vdy
         7h58KJiBn9aDCuYdoVzOm1LiXuLMuR0F0YzM9r2U5Swbblks0bSH3wG5tAvTM9qPxpPo
         7hZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926906; x=1781531706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+q54AYUt4cvMAgQNkC220cQ0wa4ldXeQa80/giwooQ=;
        b=G9EtCjj3ulE55vR7fWcr/lJw1lESIL6bwzeygUj5Jycecd5muUeYVLWI4+W6RFmUCo
         woaG0/fJrZy9HPTdlhEYeGVOfji5hLAuHMwB8tuIJiLDLcsSb4cIhmd1r+jpd/RL9RrS
         M2kMIEEeaD6wE/Boc2Kjl0Ur2tnDxN4yx5qIt7Y+vPcixwHEoKgGxjJlTRBFecxkoCpj
         dxbH7xOVw9kA2j2EMGdYTHdmE61gkzdsZTFvc0KOHNeocXSNF4Mb18a0S01qOHDIux8F
         ZLuqSayAdnjMtR3bEZWD4s1gZs3HnFrieGJ5WW3QJvRmccaMwarM5+cx8+lcKd6ftd0Z
         WpGA==
X-Forwarded-Encrypted: i=1; AFNElJ8Q74K+csblvQhhfvMA6LP3zrg9HBfL2/282e/YDq948jeXI4YpyzpM6EqipFrXCZ7pK5jmAZJxUmz/P9ycj1HMLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAyWdCkv/UMr8WtmUBSNIREvlzk1cU/VryDWlDDLqytJbjJEp8
	7L7H8V5VXvuF4OBuSXl0gKNhCJaxo7kjHzABkI/rMhp7PZyVtUp0mmFZzYyZBji1TqJrOn7PpE1
	vfhmmFQXL1g2Fzf9RSQftOIaZO4qqpBaIcLIVz5BXNPKnPHdtYf1GI1hiBojegMYNZslcU4Sa7A
	==
X-Gm-Gg: Acq92OEA9BCZkUEC7D6NzEpdp6q22qcMThSkY5wgs3Xpv9tdNqfhtyZislMvV269Aut
	w2KVUaGokqScLkpykZjMgdpgzCz8HrZSAB8NRaAyzBd3Lg5Q24kPonTIZALLDDisLOl1FpPp4tm
	7ZN85AbqsltyCIF4Mkzozs5hxC65ieSho1O7CVQz2UW0kz9JeJRYpHn4v8s8euwalhf4ZjcTmV1
	3LnyZGWykfw8QhxoAWe0fxZEaG/H6oI2sf1LtqPub6fZCjfxStEk+9Nd6E7O3PUuxkwCGPfZUca
	WpuRNF1siHCqq5+OIn5EyW7+1BysaGkzSMmk0Fzyv6kSJKhPnPecWdMXIS2hA7N0k9ghm/WH15e
	zw+3Z+KrONZXE4qNqjzCpVNeVTDI1+8YgLWzwDImcJKVMMqUl8dZ5omU=
X-Received: by 2002:a05:622a:a593:b0:517:8d40:7c7d with SMTP id d75a77b69052e-51795bcc230mr212098481cf.29.1780926906344;
        Mon, 08 Jun 2026 06:55:06 -0700 (PDT)
X-Received: by 2002:a05:622a:a593:b0:517:8d40:7c7d with SMTP id d75a77b69052e-51795bcc230mr212097701cf.29.1780926905723;
        Mon, 08 Jun 2026 06:55:05 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.209.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39def5sm385972925e9.5.2026.06.08.06.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:55:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 15:54:16 +0200
Subject: [PATCH v2 3/4] dt-bindings: mfd: syscon: Drop custom select for
 older dtschema
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-n-dt-bindings-simple-bus-syscon-v2-3-0203e6c249dc@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5410;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NcitNjSkfQ4OyFqHaqu6E2atNqkTv+Y4lzGwlPttZho=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJsmqbJ7tPK1z7PP4+30wTCt9SdFWwHN6Wg/IE
 0IMZKMvJXKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaibJqgAKCRDBN2bmhouD
 1xXiD/0bvAbsMwgDv/iH4GOjsfgkjcx7enoDg0cJsvLNFtBsZd4xhalxTE6gj4uWHVG+J3bMnDY
 /SuVoxEhMQKQSzDGj8dNgPWN3QvZNloqownDIyQ72QsFUyRDfneqMVNay3LZ6woDjSievDd1/k3
 4STlk1kmydDgVDcFZrgNl/tGsqrHHceTIzSM04tqPfWfwqMZ/EFfSCVuUAQGHTDYu0lpmt//Nbz
 yO+9k+ou4/Q1AhLWrk7Iy+JE9A9NPktJXArYdBZ2F2OoG7o+2/VNrsxzUe8/cD2sMnhv112NmKF
 TPBfMTpHN4dSEg31hysiwDat4nyJnm6QE6+4KcxOGYs8BC7UsnWIHYyTqdTrGchS0M3ZL3MefH9
 hczo4x1VTv5VauSXHhxYdsFlZQWljOy1QyoqYPNxsT5VedI4hsNtkRH9O6cUOmupz30R7dmlMs0
 HByZAmTh1qZoMpCIyPoYHEDIyuSeAJxG+9NyuwEI/eXF7+O9U24puo3V7hJ5s5i0Ssl1Wn0G4yt
 oFpCdCzNYW9B/zNdPq0CdBqEjId67pCGUXTpoHvatrv3/2pkB1jzjd7x/5/RdqgX/A6VLB9aFhN
 xT8WWq33fnRaaankrv6cL7orUBusK3e4Z6H2baOMbH1Su4jSwVwUhVkHIAYCBv6NEtBqdohMpLj
 i7QkXmR6twBaQsg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: azGfgXZVD07tGkNWHAM4VpGTOV2xYpu_
X-Proofpoint-ORIG-GUID: azGfgXZVD07tGkNWHAM4VpGTOV2xYpu_
X-Authority-Analysis: v=2.4 cv=JdqMa0KV c=1 sm=1 tr=0 ts=6a26c9bb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=bD1TNsHgvEXzglPpcYW9rQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ADPNn3lZBn-UiSoLXagA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMiBTYWx0ZWRfX69v6NRmeo9LJ
 WQRSah59MrxhYRlD0BLiKVfbgennr6OqQJ1P1Q6Qos0g9HJ13GLifMlmfyJJIyU6eJ+ju/VZNpT
 eLW66QUrtkdRnxPtKyFsgfDdEXkmfWKQMufZfMSZTHjt/0vPHNhonau+k6UfsW/hSEC14fNVfRD
 93nkLzghc5cq8CJqy1RahJTA9uHiRCUVqQxqHw8EPOW9f55uy03mKSqf11vvbtdFh+6p/rQU9mi
 qQZP+qDmLwMDBmOiCk8AVM2ejGvoiSU8F1iaBmY00tUARLmqBzFTbTooEE+E6F1nAoZQg7CoC1n
 BpwpyDufYjOis2fsmn+CY3zvGqd1wLUaGBu5o/dV7+2ay3DjFlO4TVrgtL5uB0qHeNmkTQs85FV
 bw/tSyLCJzC5YNeGrV4+pEqoy7af2O2+CH2/J0npP3h+EinbD17SWt8Vu5eD5zyT/Ciwxj/Lfoi
 omBeMR7gpfCoY8/jNdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33672-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,nuvoton.com,glider.be,sntech.de,iki.fi,kemnade.info,baylibre.com,atomide.com];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-omap@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A6CA656DF7

Older dtschema <2024.02 required custom select to avoid applying this
binding to anything having "syscon" compatible.  That's not the case
anymore and this additional select has two headaches:

1. Duplicates all the compatibles listed in the schema.

2. Is error-prone, because it requires contributor to add the compatible
   in two places, otherwise the schema will be silently ignored.
   The select list already misses mentioning compatibles:
   mediatek,mt8365-infracfg-nao and renesas,r9a08g046-lvds-cmn (with the
   latter being reverted for different reasons).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 116 ----------------------
 1 file changed, 116 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 9c81010d5a74..b70018bf1bcf 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -19,122 +19,6 @@ description: |
 maintainers:
   - Lee Jones <lee@kernel.org>
 
-# Need a select with all compatibles listed for compatibility with older
-# dtschema (<2024.02), so this will not be selected for other schemas having
-# syscon fallback.
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - airoha,en7581-pbus-csr
-          - al,alpine-sysfabric-service
-          - allwinner,sun8i-a83t-system-controller
-          - allwinner,sun8i-h3-system-controller
-          - allwinner,sun8i-v3s-system-controller
-          - allwinner,sun50i-a64-system-controller
-          - altr,l3regs
-          - altr,sdr-ctl
-          - amd,pensando-elba-syscon
-          - amlogic,meson-mx-assist
-          - amlogic,meson-mx-bootrom
-          - amlogic,meson8-analog-top
-          - amlogic,meson8b-analog-top
-          - amlogic,meson8-pmu
-          - amlogic,meson8b-pmu
-          - apm,merlin-poweroff-mailbox
-          - apm,mustang-poweroff-mailbox
-          - apm,xgene-csw
-          - apm,xgene-efuse
-          - apm,xgene-mcb
-          - apm,xgene-rb
-          - apm,xgene-scu
-          - atmel,sama5d2-sfrbu
-          - atmel,sama5d3-nfc-io
-          - atmel,sama5d3-sfrbu
-          - atmel,sama5d4-sfrbu
-          - axis,artpec6-syscon
-          - brcm,cru-clkset
-          - brcm,sr-cdru
-          - brcm,sr-mhb
-          - cirrus,ep7209-syscon1
-          - cirrus,ep7209-syscon2
-          - cirrus,ep7209-syscon3
-          - cnxt,cx92755-uc
-          - econet,en751221-chip-scu
-          - freecom,fsg-cs2-system-controller
-          - fsl,imx93-aonmix-ns-syscfg
-          - fsl,imx93-wakeupmix-syscfg
-          - fsl,ls1088a-reset
-          - fsl,vf610-anatop
-          - fsl,vf610-mscm-cpucfg
-          - hisilicon,dsa-subctrl
-          - hisilicon,hi6220-sramctrl
-          - hisilicon,hip04-ppe
-          - hisilicon,pcie-sas-subctrl
-          - hisilicon,peri-subctrl
-          - hpe,gxp-sysreg
-          - loongson,ls1b-syscon
-          - loongson,ls1c-syscon
-          - lsi,axxia-syscon
-          - marvell,armada-3700-cpu-misc
-          - marvell,armada-3700-nb-pm
-          - marvell,armada-3700-avs
-          - marvell,armada-3700-usb2-host-device-misc
-          - marvell,armada-3700-usb2-host-misc
-          - marvell,dove-global-config
-          - mediatek,mt2701-pctl-a-syscfg
-          - mediatek,mt2712-pctl-a-syscfg
-          - mediatek,mt6397-pctl-pmic-syscfg
-          - mediatek,mt7981-topmisc
-          - mediatek,mt7988-topmisc
-          - mediatek,mt8135-pctl-a-syscfg
-          - mediatek,mt8135-pctl-b-syscfg
-          - mediatek,mt8173-pctl-a-syscfg
-          - mediatek,mt8365-syscfg
-          - microchip,lan966x-cpu-syscon
-          - microchip,mpfs-control-scb
-          - microchip,mpfs-sysreg-scb
-          - microchip,sam9x60-sfr
-          - microchip,sama7d65-ddr3phy
-          - microchip,sama7d65-sfrbu
-          - microchip,sama7g5-ddr3phy
-          - mscc,ocelot-cpu-syscon
-          - mstar,msc313-pmsleep
-          - nuvoton,ma35d1-sys
-          - nuvoton,wpcm450-shm
-          - nxp,s32g2-gpr
-          - nxp,s32g3-gpr
-          - qcom,apq8064-mmss-sfpb
-          - qcom,apq8064-sps-sic
-          - rockchip,px30-qos
-          - rockchip,rk3036-qos
-          - rockchip,rk3066-qos
-          - rockchip,rk3128-qos
-          - rockchip,rk3228-qos
-          - rockchip,rk3288-qos
-          - rockchip,rk3368-qos
-          - rockchip,rk3399-qos
-          - rockchip,rk3528-qos
-          - rockchip,rk3562-qos
-          - rockchip,rk3568-qos
-          - rockchip,rk3576-qos
-          - rockchip,rk3588-qos
-          - rockchip,rv1126-qos
-          - st,spear1340-misc
-          - stericsson,nomadik-pmu
-          - starfive,jh7100-sysmain
-          - ti,am62-opp-efuse-table
-          - ti,am62-usb-phy-ctrl
-          - ti,am625-dss-oldi-io-ctrl
-          - ti,am62p-cpsw-mac-efuse
-          - ti,am654-dss-oldi-io-ctrl
-          - ti,j784s4-acspcie-proxy-ctrl
-          - ti,j784s4-pcie-ctrl
-          - ti,keystone-pllctrl
-  required:
-    - compatible
-
 properties:
   compatible:
     oneOf:

-- 
2.53.0


