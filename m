Return-Path: <linux-renesas-soc+bounces-33670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Vkj3CInKJmpokgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 15:58:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D237656DB1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 15:58:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hYpbfRSl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="P3p8+xP/";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F9B73041BA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 13:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FE13C37A9;
	Mon,  8 Jun 2026 13:55:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A773BCD0A
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jun 2026 13:54:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926901; cv=none; b=WDRjIOAgrCOyeE6627Wd/7wBpPTQ0KdX+u+HdxUVJ+OVgtfX1Ita88E4vRfEoQPHWuuB7FBjztUw2cmE1RefxsksG+izQ4V0pi5vfKcynTbgAb+MRWiaaDlybQMjdYDHY15S+rrgOgVCO8CN3Olc5Pnz2aCZtmKEn/Kly4qNhgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926901; c=relaxed/simple;
	bh=H4Y30PW7n7YwDjrf08mPfxYtg1F+dQiEuh0m2Rr16mQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QJAkR/FZo/mgDLbwYVlb5kGWy65BBcbGT7UOexzPFZSq6dxOmOzr3gkVqnyT1Q0wh9k+bLr9tuXS2K9Ygpz0T8ODfyjCcz2aPhr/kXBE+35stmynorV76agtJvQZ1JKV+wl0TLQ9Px0SXvBXwboRSjL+e0ycRlPDXAS4XB/VtG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYpbfRSl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3p8+xP/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRIlD3758678
	for <linux-renesas-soc@vger.kernel.org>; Mon, 8 Jun 2026 13:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q7Ea94Rrz+UAH3itxmW5/gMgVCOZgJd2bHTd3ZfBZeA=; b=hYpbfRSlRhjxcN38
	GnSZlzDqT2XzTYdZSGTisRorqCFjwIv9YzM7G2BoopwHnxrIVbonG0+6Nz7r0Xx/
	SShVIKSd0kEA3wQY7lC1WuNiQN0Ht8MUyKxj6irPGD2Wnz5bgkVk7P3qBjSogDx2
	h0v6kQuDACZskcJNkPV2ihMEVyJhj6Nk76C2JxGsahUfqBRTrG6bLe3PRfkMyH4f
	VTM/F5vvc7Fw05pQehhB4PwwlHhCbtQuDMOoVD/9LSvbfKjpBgw22C49NpdqJBTi
	gwa3AmccsdtuDy3KeYFhbifTPKXSZ9xTEOh/Q2gvmj8i6A2pnhAY1a46AHQCKsGc
	ZExAaQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0ha0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 13:54:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177b8df670so66853061cf.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 06:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926898; x=1781531698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7Ea94Rrz+UAH3itxmW5/gMgVCOZgJd2bHTd3ZfBZeA=;
        b=P3p8+xP/VEXXlXxbeXO0Y3GWOIkLsIwQLjFPv3qEpYoXG6eotpyDqZteOacksR+ddn
         +jL75yyzRzsLvrLRck2eC+r2Uan0LAQvIpoeWDAcr07EHcPe3LCDxRaBx5iOgrw4r2cH
         j59wL8RnVAm4n9GyV0yv4+S2fl9s+A2+bO4m+KBQcenDe2TzWCEE4FYzprUcdUVW7B99
         3lNRO8UoNgzWgCv2EJ35hvQwVIHWihZK4z3++kfCCSX8V+m1ouTTNid7EPN+fN3J1i51
         U379SxWEbYy0CyBnYansXYmsjEc9sY6SnTKGL20qxcWgUewOpQaixIR0LxqUTR07ExAS
         mK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926898; x=1781531698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q7Ea94Rrz+UAH3itxmW5/gMgVCOZgJd2bHTd3ZfBZeA=;
        b=Nk+B8sQslAYG6H4sCupGviaptwMERrbTPLxzLvT/ur5YXuVFakMHiitozxe3wHPPl7
         YBB45q+D/lDhJAl65qNf78y3jrP5xWJmi5LgH1UfCphORiUC/utXWsEJri1qKBnru6Di
         z0BCx7i58z6xsONyrUtiJ2PrCHF0TRLD9PisXKi6/GYi6koDB25F1Beo7XIw67RDjIfR
         is3QI7I4RkWeIcLaqu/k/yridjzOSBf4rtOwxvxtgkyi3xmetCS3lvV99GUTk2jZUFlM
         6ZXm4V2IHtHevh/gqbwR2Z8CdZcBQ0oxxlbVFtvS8ftKXAGumdekVITJUuKFxa3bUjr1
         InDA==
X-Forwarded-Encrypted: i=1; AFNElJ+3aeW8khf9iSYzEVzIcUX0DjHqdRAriJUyL7arx4okOf5II/ACVIblz/jxNjN+JepGFtsuXGt8EVwKmLQ67t3sOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMNuDZpXN72JnlvfhB71TcGJ4lHELKKcIYUq9immEkLQlj9fw1
	nZDIpsWQ8kl59CPGjFy8jU4rHrgNjKtKf2TSoiHBQqljZ+BXh+koOR4xYYWFD8/fEPADuTsKpn3
	KsbnJz0qxqHYKIAviS5Nio3s9MJTzj/po9Wiqf4cvuwFoGAlac4WYj6vQqy+RuHXlwFkL8Ft+3w
	==
X-Gm-Gg: Acq92OGEsQiAeUDRy8dxCl3Ix7lRFPJMzsvBeOKWVyKerK2oyVct11FCNsccO6AdgOt
	JQk9wcvqfLkRU/hopLoL1QKpSLuVfz2fmKIlF8oTtRYlzG9yOAzkHoT/qRHdSSj58B0eFmKnmWq
	QRVfehVkGp2gK7PadQy4IJ3nkji1ll4FBNjTJmZLWm9fS2JMmVImjpD1bP66rfuOgBA48twORlG
	ub6+3xbvBDC9uOvmO+ZERBmIh88di9tFt9+/Ap20xnJXkH1Jew1k/ytIM6JO0trhxpxpigaTGf+
	5CQEJRQVy2CmJaxRDs4cJZmCHH/nMQdNXm7zBIEOacUCFd5fWLKSErjmI3o49+HRFuo4yP1hnHZ
	UDFy//Bc65R2RU9bJ/Kp1oGnQH5uY9sm0Gtl5N53NmQIRBM1tP/Xjtis=
X-Received: by 2002:ac8:610f:0:b0:517:8d76:5975 with SMTP id d75a77b69052e-51795afe67amr214335921cf.31.1780926898163;
        Mon, 08 Jun 2026 06:54:58 -0700 (PDT)
X-Received: by 2002:ac8:610f:0:b0:517:8d76:5975 with SMTP id d75a77b69052e-51795afe67amr214335231cf.31.1780926897572;
        Mon, 08 Jun 2026 06:54:57 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.209.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39def5sm385972925e9.5.2026.06.08.06.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:54:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 15:54:14 +0200
Subject: [PATCH v2 1/4] dt-bindings: mfd: syscon: Disallow simple-bus with
 syscon
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-n-dt-bindings-simple-bus-syscon-v2-1-0203e6c249dc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2763;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=H4Y30PW7n7YwDjrf08mPfxYtg1F+dQiEuh0m2Rr16mQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJsmo2kW8tcedUBmp80JofuUehC79NguEf1PFh
 XcCbWPOMCCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaibJqAAKCRDBN2bmhouD
 14EOD/9xIcV/HQiHw1XWxvuHk2Qy87m3NTPa2K0+4RU1CP4cK1GoH+nzEBS/ufXxSxtt10zt1mk
 Fy4XRalyypu0RhdaJhAtKMLtpxpAIoFQKIFWIdRKbrZM1tPIhxG71dLTmu8wBXlS/TbTIfIarq+
 /G195Ly7XlZbsA0iqZ+djQbdPSw6FH9u6O7/Nm5cXsZ5OHUo4lhOaFCKZCWGrfMDZds4L3LHTmd
 ci8wqyYIKIHtVeXD7leuCoao/TZjklRZu2Mtr89T4UNkl+NEWeTTV0Yoqm0kIhqc4b3T+IRirNF
 pu8foaoHS2Gl5aC9POZ+aIg6lHM+PiaWyyoDzVRIx12hyT1MeNkczyxCgvvg6AzVhPiWR25Hk7L
 N43afrEN8pDRG2yLtFMGBD0LV+aDsRKZ7/Lkh8qaSEpdjnX64dCHtQHzZvNB6a3BqFZS2GxXoXi
 Zk+/N5t32NAGl0spVTiNXt7XaRqkVj87+bkdxz1g2d68N3Oa7GqkQpM/ZAXFlYz2e3JWoBJGF7K
 SG0GDpUY569JTrAZEZ0aYxkyDPHqPI4qO6M+lJdHLQXlxNh3J1ZI6vIpa+0HG55YhgjGMg48jU/
 MX1V8umG3wHBqRMKe7bLEAMiq16Xfj4PrfoREbeDpFxD7u2+niV0ph+kiyNGaV74xg1Gpvzq3Cr
 clwZfItBTLH+3jQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMiBTYWx0ZWRfX8yaSUAB3wUjZ
 GXJrv8/rPM1Lc5S1K8ES5HLWX/YoQeFYewYxh6hk/CPisia7unqMR8ajeV5YfKZB9zNTzSjpgH4
 12FzTiBl8nL2zZCP8uTIttk7zOxJs9xpbhNCz7jQFdDAAN3Mp2q99ehBzQlKxh9KP1+VglQe3TG
 eG9zx6L2qObkg8GpMpkBiBDWk+O0GFj1TLYqXWPVcQmHvQv90JNnupjWUe9epRLxHPlzVyQiT+9
 j5hoVesZ2CH7StV5TLANz1dilbNJpT1q+uAXnVlZqbNZ1ICuo50agbUCmhpiX7/PsfFj5OCKajc
 BSvcUpBESipPC4KdK3Jc++VT43Y9EsscTxEWxJoHACFmHX5GohSRUhHuCkq1G28JcVd9HLMpRfT
 kG8ttEG8UECt2CoChBzDfYDCINnc5eXCLt5LmJat8SZJ44LgqgWCxUBPe6aItipxqh1cPxoha17
 vOabj3VbGz5CPklq+5w==
X-Proofpoint-ORIG-GUID: C3o52ha8XSti4VGjU6sAh5MAx4PcY0r_
X-Proofpoint-GUID: C3o52ha8XSti4VGjU6sAh5MAx4PcY0r_
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a26c9b2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=bD1TNsHgvEXzglPpcYW9rQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YC08-fj938uaX1hd5_AA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080132
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
	TAGGED_FROM(0.00)[bounces-33670-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,nuvoton.com,glider.be,sntech.de,iki.fi,kemnade.info,baylibre.com,atomide.com];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-omap@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 8D237656DB1

"syscon" is a system controller with registers having their own
functions, thus not really a trivial MMIO simple bus.  "simple-bus" on
the other hand is just a bus on which multiple devices sit and the
"simple" means no functions are allowed here.

Combination of both "syscon" and "simple-bus" is abuse of DT for easier
instantiating of Linux device drivers so add a schema to disallow that.

Unfortunately there are a few old cases of that patterns, so add
exceptions:

1. "cznic,turris1x-cpld" and "img,pistachio-cr-periph" are already used
   in upstream DTS.

2. TI has several DTSI with a child of SCM device (e.g. "ti,am3-scm")
   using "syscon" and "simple-bus" but without a dedicated compatible
   documented anywhere.  Add new compatibles for such cases.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Complete patch. I accidentally sent only part of it, built on top of
   internal WIP which I forgot to squash.
   I received Ack from Rob, but change is significant, so please kindly
   re-review.
---
 .../devicetree/bindings/mfd/syscon-common.yaml     | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon-common.yaml b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
index 14a08e7bc8bd..315357da146e 100644
--- a/Documentation/devicetree/bindings/mfd/syscon-common.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon-common.yaml
@@ -57,6 +57,38 @@ allOf:
           minItems: 3
           maxItems: 5
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: simple-bus
+    then:
+      # simple-bus conflicts with syscon - if a device is a system controller
+      # with miscellaneous registers, then it has at least one dedicated
+      # function thus it is not a simple bus. Allow existing exceptions.
+      if:
+        properties:
+          compatible:
+            not:
+              contains:
+                # This list CANNOT grow
+                enum:
+                  - cznic,turris1x-cpld
+                  - img,pistachio-cr-periph
+                  - ti,am3352-scm-conf
+                  - ti,am4372-scm-conf
+                  - ti,dm814-scm-conf
+                  - ti,dm8168-scm-conf
+                  - ti,dra7-scm-conf
+                  - ti,omap2-scm-conf
+                  - ti,omap3-scm-conf
+                  - ti,omap4-sysc-padconf-global
+                  - ti,omap5-scm-conf
+                  - ti,omap5-scm-wkup-conf
+      then:
+        required:
+          - incorrect-usage-of-simple-bus-and-syscon
+
 additionalProperties: true
 
 examples:

-- 
2.53.0


