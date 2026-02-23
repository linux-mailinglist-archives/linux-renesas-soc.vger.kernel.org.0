Return-Path: <linux-renesas-soc+bounces-28383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPdjDAocnGkZ/wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:21:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E54CF173CCF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52C0E307C9E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205EE1A0BD0;
	Mon, 23 Feb 2026 09:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ToyIMv+4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T4xqW1eT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2804204E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771838001; cv=none; b=HnXKSjCuqzKx6jMyp3a2ICBjh73J9wtSGaWypMAVPih+zUWDcWLi+D3CjDzOJodg01mQlI2S6Z1GPo+EbPVUZ/9MgOLSfaaXnWJoNz81PVWc6zdsQWTdIcjl+81iiMh4SwpycR5TDBj1VJw+PQhZKgnflntdvHP7u+qiVH3JMFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771838001; c=relaxed/simple;
	bh=pV4BB7VESvwwOGoINJ0yyIw3maBinxln5Jf5/nDWw4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BLzT6WbnfOvCPSVH2qL76tE8x6I7F1+X2aQiH4aqynoSAFd7gEXSdzdENqEidScqa2WkMGGaVx1wVqtgA0vOC+H8ke9cJRpSZ/tHi7QAoeUgUcUTLC52crqn0IshgMvvGGgSwL6XMoNlJUsbx+guFd0a07vhjAl3YYxKtzVb9vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ToyIMv+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T4xqW1eT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNRhrF1262788
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AV/DHL0paDpUXzhwtvc8PrdZr2Xx/XbyfZPyz0Y56tQ=; b=ToyIMv+4gPxgJGDz
	OtTJXTi+6ijgFirVZaPLg6Jy4RUZZX/AFbbK6RX8Fhl71qcqqPoNGUpt+HIkIoYx
	KR6qVao5alntB2UyLJWIr5+IeFEVsdgt+LTmo7nncGhgyO6pWAx4qD61h4uLIB3B
	o90pKouDd3F14S6qyY3DuPE2J12wqRQSznVP4aELkujb7vuz8p90KIAiAPm7R3TW
	nZ3IliwtwLlDnho2o8M54txvXbR6J9bvN5gRnY8dFTSeyGYPZj/sxLUNk9NlpXzZ
	D1DSFY6dg5vPPwAMLMHoHqL37h7BSrFoOU6IELobApS8Ifq4umNQV4JoOpgjMcqW
	Vg84Xg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603m44f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:13:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3d11b913so3831759085a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837998; x=1772442798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AV/DHL0paDpUXzhwtvc8PrdZr2Xx/XbyfZPyz0Y56tQ=;
        b=T4xqW1eTvR4vUHX25H64Jo6z3mK3x42S+qWNOTH9fEBIM8wwVNmWik+I81NcNYhfBZ
         c+KkjsS9EhUw4DNkXunMpur526pvWoMBapItexnJemgOr99NxFIUUYfaSdoGgO1m7bF+
         gLFaHaLBiRgogLQ/WRgBLdh14uZpQAXw/WB1ir6KKi1yCOZszhOvElInbf2zhdZKdRDx
         bxWU8UmCdwpz2978fQ+TbanqKQ0a55eQ58t83CJtbwbtRZmFwJxAih5lTv7qOqf8MM4G
         KNcnT8Pc4QgLqKapxkHl6llNuAPML6Trwl05Fw+MufaBlIE+2h8Demq97Riy1jsuFZCt
         XFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837998; x=1772442798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AV/DHL0paDpUXzhwtvc8PrdZr2Xx/XbyfZPyz0Y56tQ=;
        b=G7yxTytRVyQ1rmMKPLRCHe0JxryOsNBI6U5AChE/19ro2jjFEJZ9m0ql6zIdPii1m5
         APcUI+asE3G/jzG4M9Fi9ycyN7iT2tJmZuPnEqNjqxrCKYomn4sP6jz9z4Ty+eUJB3Sy
         hRAxAzwkS26qXT1D/1I2YjDM8f8BcLL037TjYg6QkEW2EpIxPa81HEtgQOH8CMK1MbVo
         XDYEejwDK1s9BM2PknxZZjoLoiTnv9mqy2OuLcetjG9g6Lwig5aeGsbpMxwVjfth4JEd
         cHp10S76WuPTq1+uLA1Zx/0EbO0Zz/qHks7QMgMPD2a9vcP1JHFJJ/OXmV6W5z2yRGz9
         bHaA==
X-Forwarded-Encrypted: i=1; AJvYcCVTAHhSNR4X4UJ/jWlidYE/Ov1NqmAX5xZ9n1uUzJ5bxrLxmeAxx9Q+UnTyjSgWEurxpqTyZ8j8UsP1CVakqe1itQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJPzBcqWSXY0S57RqxwQv6d2/R4NEGHFD3I1KLxKqD6bDIN1zl
	TXi8uNggO6RyOed/Pvgry+//dC1tcIo3+fDUo3smjeX0W6xW5u1uNlHLvHwQJnAzqExv9irI8IQ
	LarsuSTYT23554Ro4fgtHjxcBs96OGTFGW5qr9hF3TqnzH2bbCLpf9Z8Big4UnP2Uz2cUpSofZt
	RgwRcOLw==
X-Gm-Gg: AZuq6aJ0DRRLBsopECSGzLNHFJ+St50VLKD3Aw99TXuTTxDFJUVUv0QN5AEXK2yDUIz
	PBTHn9/Z/rzki93ACV2oMlOYBnsawJC67dPwIDYwhoOCOBYsUu3Aw6i4FttOEpbpxEqGUQEE2wO
	z9h31ltqVkigQwInlHgilmD+pD7LKxaszQ5zevZFWd9HDp2blct6d5TB9bDEF1JdgNFPtZ1LPMT
	snVV5qL8h/0OdHVOH1RHuUAZSNOjfz1Zr46ds/lQ8DSeNMIU0nlbsOse28aH5Sh8chR/6p2zVhf
	4knauHNq6AtZpk3Wup/4YmLz5AX4I8XwKX80hensrqYZDhL5lFtWY4NWJMmVT5XowegGZP8mk6/
	3xgsRK1d65/jdizm/S9/r0YINsqAEEHtyKlzZ5IzJ/bADwp+62sfp
X-Received: by 2002:a05:620a:1aa9:b0:8ca:123e:819b with SMTP id af79cd13be357-8cb8c9e6557mr1092783385a.13.1771837998254;
        Mon, 23 Feb 2026 01:13:18 -0800 (PST)
X-Received: by 2002:a05:620a:298d:b0:8ca:105a:f5ca with SMTP id af79cd13be357-8cb8ca6e5d4mr903307085a.47.1771837570545;
        Mon, 23 Feb 2026 01:06:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:49 +0100
Subject: [PATCH v2 03/12] i2c: bcm-kona: set device parent and of_node
 through the adapter struct
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-3-d78db0a6fcf7@oss.qualcomm.com>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=995;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pV4BB7VESvwwOGoINJ0yyIw3maBinxln5Jf5/nDWw4w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBhyCl9Rsm+yhDXm29XU/HR2ugRm1pVK1Y0CD
 7TkNCnQDmyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYcgAKCRAFnS7L/zaE
 w7sLD/9SO5N/l8NkJMRZ8orITe68nCScnBshSzOQl8EaGa3Jvtk/L6f1vmYPYghezYgbU0WUPaN
 3OGPStzjSplnC5Uz1Vwe6MXVBKVTcbFm7QE2UOnTNgutHhrBBFyzeRvaVxQfNpFtPvVtANkMVNO
 x4gDOe34eQU2T/3XWReYHftzyFtIH5/HUN4lPIfv9Zmji2bY1AqKceOY3SGgp9t8DAhgDHMrriu
 3dDpBleL8kMsea2pzl2AX08+3SNj4BUPQihaut2B8qV+Oq4Aog2HlJ+o9x5cuCCGmlzuXzTR/kh
 Ia7RmentNuQ3hevCck55A1CgD7SXDP0osGD41ERDL//ZnADXc6bwgvew41k4GfQljU4dyloLXaV
 9d+QWNt1A5E4rl0YRPBya6pxjKsv/aGWyUH+k0/VXskdehU3dHYT/d9SYyBYEBqlk02LbEWVf3e
 IoT+UtOmEVc73SghWDbQu5u2keilAj8ivk779OFrHM3fM9bZC4jkEm1KQJ0a5S0LOqz7jxL8mMt
 qmkDF4Jr5jhmohm/R74LFaWAGcpcBDcSqpBxa+3shxx+3Nmv5DNW71aB7UmPbU9djdUxDMjpBFR
 hz1SlZPTMQYxf+zrDk6TVx4BnyUMUhyAOYttQlGV6VwcHCm4NRVUWGwJARKC2DnUtAJd4Si1BtW
 tbT+IjCraKX9bsA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c1a2f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=xxYytfOIdaUIj31isgUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX4w2DlWd4yLLw
 5lgkiIwK4LbVQkB1geLFpni/kqGa/4nF4MEKdUZTcaaJmO6AKh3YsE2bh8awA/ggrmOVTbXxvp0
 kb2LNGFVZDYnc2zhCVIKZuDpSntc9/Bpe3cPBCm8XgZMvv3ZaVRnYkZur/g9Frv40QjTrnCjHSV
 3+o2J+lPSgNsKEZ5y5Ge4G3vkiioSiZ4UiqqYD7nEaHNOXsRQylMbnJJi0ZDASHD808RLqsCdYn
 vciRrA0XXf6fjNQjzFiVBB64LQFeDYwtr6op5GiIbDWOrYsZYPzmiYT11feUKQ+jzQqgCIXoitV
 ExSHiwcGIXxTDjcJEWaZ6e/BXvY6oWaAFGvLACXrvqY/kODUJZXw4YatipZezGGthCs+Z8jdArT
 91aslsVl2SONGLaE8EXPuEN96oZsEWXFTQ27gW2fc8wVYNDa6cFV+BH8tW4P+Z9of9MZZZAWSWW
 zqxoV9rtDJcZUUYs4uQ==
X-Proofpoint-ORIG-GUID: ut3Eh0TRtPPNQlDrKEei2Kx2zvyTRLJD
X-Proofpoint-GUID: ut3Eh0TRtPPNQlDrKEei2Kx2zvyTRLJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28383-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E54CF173CCF
X-Rspamd-Action: no action

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-bcm-kona.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index 9d8838bbd938bf6c43d9553d9f54acac1282f7e8..edd79689f40f451fc216455c9da5704bdc73c62f 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -840,8 +840,8 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
 	adap->owner = THIS_MODULE;
 	strscpy(adap->name, "Broadcom I2C adapter", sizeof(adap->name));
 	adap->algo = &bcm_algo;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 
 	rc = i2c_add_adapter(adap);
 	if (rc)

-- 
2.47.3


