Return-Path: <linux-renesas-soc+bounces-28368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MKrAgcanGkZ/wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:12:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE581739B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:12:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1577B308BB88
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04072354AF8;
	Mon, 23 Feb 2026 09:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAQdRWvv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zg73osz5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA593502AC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837593; cv=none; b=IVxtYSxBVrBt3mEP1Kvmq9Y4QsdYWO0RT9DeUdx/Z1KjC4kkZMoCsIDuDJ1Ttciy3L/ewoiR3ioROx0BqNEGLx5NpcUTFi/rZLXzmTbssL0ux5reYN2zEYFoTw4CKVIDGmHTsZJTsfF2pzusK8pKIsMTzyD2UXkXQ+/DLZYblLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837593; c=relaxed/simple;
	bh=iacvmP5MKst4koF4pQzdNY4+k8gIR/r7nU+j4v1o/rI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i2qJiflNkS++Q+a2zZg0KPT/8glhffBqbuLqBR09d9Z2BH0vgSLMiMT0vUrtd/+ayMWaQqnIlKWSRzidW5UPqmfOT7E4OXEPYup8pD1o7LwfmLGP9gEqaYI+dK3XH0CXLeqpQKWU72f+oJZfGcn1t5X7Oo1Hse9lyj+hWYJ1G1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAQdRWvv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zg73osz5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMkwpZ1483271
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=; b=hAQdRWvvV0G+NLiW
	MEGF9Jf95N7zQMt+9m5bmPGFLSo7Eu9+Mt03F6fs+Se1rzZb6pK1IW6IfRGnhR1Y
	o8ODSwJeWHfhUQUeazDO9mCdk9QlBo4vAeoXYSwgR0uaIuKCxeXh9bFuQ1eLb23N
	KDcGNM1YBpWlOOSI87m3Xfjb8ZyG5mxvfyVWEEZEWgqQboKe9MTk6uJhXGSORwts
	sNYIDpmBhp6n2XqiB3YvgX3VwBIC3I+pZMDCysz0hmBryFQJxW5Ni6liSbnKx2Go
	aegRmaZmzQeBegQGQEYD2xBPgA6stAI4RC2dePjjcbGPKQ8VRsE/OsSEjYVyiwuS
	WdohNw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5x7v3q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c882774f0dso3928605085a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837588; x=1772442388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=;
        b=Zg73osz5AKhDUjaTIc3+GKLwbpDfrSgd72kdmouFXx30Paj+HuZQBcp4i83JIZi18y
         ehqaJb0eQUjXCl2VmnK0WiDa6KvIg76HAEuir9NjoZTux9uKtMF5xhNAaxe2T3ROfhp5
         Ibgb0BbX+ooeE6buWAfO/xcycEAP7VhFDlEAw8B2HDI1ulI6sXmlTTuApYFrnIFE8WS9
         qMn/J7m4OSCdEL8CYLvzxktvurwTUTZk9X8G/AQ1qcLIZerl7aB5pAdEqHoeO1cAa2z/
         684xdgAlrmGU5vBx8rFtpMA0SDZwUP6H4kQtgrHLMu5CVDDalUUicOJ3SPnnelwBTCIb
         2Ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837588; x=1772442388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=;
        b=wFpFvuyqNDD7ZtqAm5Qi2Xsxt4ylVfNNPCjqb5I6WANVKWW7FjXFWVbIGuFwhND+pX
         EuN3GW3PH8QbWWzd1IIRbMEstuA+8TftdiHTmoVbQpKyzmASApuW6Ru0C6RYaPpp3VLz
         ksEZrTz9hdKXWar/GrLrzg0HvBf9xCm/Px+vmIZHTIN6uTTW9nk88yf9LAXjKNjum102
         Y1V6iwKf1QwVp+bLhbQlw/UKHuwYPCF3WT8mRoC5I2G/kcsbZ8zoqGlW2uhMWAyo9y9K
         1dA+WXGTrIcxEEIXD2VwPshnwaUYs/XwAoBa1sOsqePLUJkZp+AUo3EpB5dECEKpC0FZ
         cakA==
X-Forwarded-Encrypted: i=1; AJvYcCU0XlQwQDu8+1Zg4+bVFTmN95/X47gPqsncIxG35zIguVKyrsqGOltwOWHMbNHfpU4ib7Opt2QIXy98tx7GD2d+9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAFT0FyEWJOHfc8Rsr5ZJJuv8J3nXzUu2n9FBU+ypGP6mmjEW1
	i/YBmDxWRSNlrDhfItWpmooxxiFHt10cI+kKYeuJ96ZM3ZuMA0daeF2Nikf7GbSio+MkVP//wEw
	Kwbj4WA6UvQVHTvW3bXYwOcm1PF5qtjfiXG7Kwu0NTyFCsDTPT4oDEuCwSyozcieIh2zywiYrtg
	==
X-Gm-Gg: AZuq6aJJ6PhGZ7cPKCE9YZk9yI4UC865eYalOVclllEfeyBHVg4XO4Hn9Ic9H5oO+mf
	9X/WWmhoBlgkQn51OHjDQwOzRrVtZnT4Pc1XSDSBDttviFUZzNOEKAKYcbp4O+3G6di1/wUylr7
	D6M6WCXe///z8NNh6GEkjGGzaUrE0cHe1iVG+SXRChqQ9gkoiXNpM9WZLy0Ab3laiKe6UFiTs/M
	2RVvRMtAlXhMdlcMyl1vIY1ZythhLkIJoU+i6BE9//GCAZ28E8JOYNm2J4kMjP0I6o76IsSPbmj
	jEOWADFmmBOKxqB3YQt18egrVAJJBnY950BqZJiHOL1mQas81kxTy5KI70OzbsfB+fiVQ5dtKW9
	ztKup3PYVo6T4K28ESemhPA9QgH/WxGy5Xbi+Bw0dYRTENWxohiJF
X-Received: by 2002:a05:620a:4587:b0:8c8:82a1:11c9 with SMTP id af79cd13be357-8cb8c9d1dcbmr922891385a.14.1771837587519;
        Mon, 23 Feb 2026 01:06:27 -0800 (PST)
X-Received: by 2002:a05:620a:4587:b0:8c8:82a1:11c9 with SMTP id af79cd13be357-8cb8c9d1dcbmr922886285a.14.1771837587053;
        Mon, 23 Feb 2026 01:06:27 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:26 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:54 +0100
Subject: [PATCH v2 08/12] i2c: mxs: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-8-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iacvmP5MKst4koF4pQzdNY4+k8gIR/r7nU+j4v1o/rI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh46t9YVusxGMRyOKiO1gXCj7YchvrY73yIi
 M9XKPAvJqmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYeAAKCRAFnS7L/zaE
 w1f8D/9Kr6cIxWLtSoo/iCsrKZvQ1AH7s9U2qJB6pL13Bs2n53X6os+fQTcQ3mW6OqL9+gW2IBO
 hKJyz5n049Yg9UAulAPIB2NwtjSqS+2e3S2e4+YVRmkxHqOdSYiUcQiX7UKJQU51B0sRz4x+Jsy
 j3bdNkn8RXeXakq85CDPNGeBlub6cxzXNysFXSejcPM9tA9av5dQSSq3w9uAg6Z6JlNv2rkjfbO
 Mru0GOD4rjDb05x/1ld6B71rL2iqeiOY6LJ+5Zag0iNaqwpIroZIZGRg8cnygQ3av91fBgclbCE
 wdt/NmYrtU9IIPBwJDv3Jn1NbLe2TjwYYADsuEGwKC2OJeadyxdITubVzqMoZVdr19TWwEhMjVQ
 AEImAkWG/9zFYjU4his2ENsP0xL/V2N6R70qdXddM3VPqQUOnpD595mWRSkqQgIfVG47kt3SB7Z
 8N/tLHhNvG6+30lNhzc/F89tdmILZIhk0D15gcNcWaJ90xx++Ua/MCzmp2wD6GDTuoHkYEt4hXV
 tO1YDz8vjze5y8gIf5ACLG3claNn3De8Yxn7RhBwfuB3pg6YxMWkplKp6r2GbZJdQDHEpWdLJEL
 owN4Lg0hxbwpY928+IW+n+cKYnIuhUEC+JQbKv8kTubPpXwlNvRuGlvIyVrD413i2bk0gWxDFCp
 W78klu2oVB6AoJg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX8XOSp+asKt+u
 RAhFR1LJyJnaFMeQS57YB9WTJ0w+rWYgLFV5Rjtcvs0sUWLp8s1N57/OQnoxAH/VmR5VUT6lbhQ
 UD3kpcTdYE8dijTzH3mDyinudOVWmYT5HMh74kHJag6i+3dmHS/MnF1A3PV1nCdF89C3JFu0Zk0
 9E1LcCRJ5HsQpYCM7SvXHpk8M5FV961WfM8UasYDrNwC3rX1HsjaCIcphEHHyCmgQQkniPxwLG3
 SwkZxERgYWJ+S8qJwgmHkTHAagnlnwY5+0c941/pbJdwzfhdDq1yFzhCjkkDUQJP4lo6Rbk/6/I
 ESolBsqbKVpVZx2CAKLT18pdThdl59tzZDbwE7jgZQfBc92AsGmVnEFNEhoHcVzcSYxHsM1USzq
 suXR+uNMN/7o7o08g8caTXDtF4195udN8P87vIfNOjIOup038jLPs1E1Ct959kVkEskNJINrg2w
 ibGctDycKxC3jBP87/g==
X-Proofpoint-GUID: d_auep6hH9vtpwLU6VBSdGYPpT74krrk
X-Authority-Analysis: v=2.4 cv=X71f6WTe c=1 sm=1 tr=0 ts=699c1894 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ZBRMoY1RY0NPWYz5CrkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: d_auep6hH9vtpwLU6VBSdGYPpT74krrk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
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
	TAGGED_FROM(0.00)[bounces-28368-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: BDE581739B8
X-Rspamd-Action: no action

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-mxs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 08c9091a1e35151bac8d4adb80abdbd29a62b95a..bfbd96ee2f483cd1dd872c3448eaa6a17940d70f 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -849,9 +849,9 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 	adap->owner = THIS_MODULE;
 	adap->algo = &mxs_i2c_algo;
 	adap->quirks = &mxs_i2c_quirks;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 	adap->nr = pdev->id;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->of_node = pdev->dev.of_node;
 	i2c_set_adapdata(adap, i2c);
 	err = i2c_add_numbered_adapter(adap);
 	if (err) {

-- 
2.47.3


