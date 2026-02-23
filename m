Return-Path: <linux-renesas-soc+bounces-28367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MATGMukZnGkZ/wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:12:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F8C17398C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B150A307D807
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0020350A08;
	Mon, 23 Feb 2026 09:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VohCfQdI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ix/ySmlD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C06134F27D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837590; cv=none; b=MbQVka8tyauRgDMHb68RLv5q3dBrc5njlev8Ez2K/efWT73UAeFw9PNb7nwS3aeIV+V3UggYJfHkCOsyOIIN6kD9AFCLjnVcT06ytp9KCjyWgB917GUm6EGmYmFp65jiJTfg37iqQ/ksld+6ZG41UWjfIySrCLyyVKDXiSCMOjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837590; c=relaxed/simple;
	bh=rx2dtWdEbZEet4K2jCNLxIpDHbio19pJqqBXzjxrlr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IwOzEiT9HvWwi7WAVWU+CJrVT5P4irswusfHcYNOg3Tng9NWkGrMxatpLwGyE5jh6rIYcMqcALcY2OcuyYD55/rjpKbZvrvqPlaEP+k+v+OidYhl5QCBfDCyPUu/7X/iDI8UNj+krHG7H4V2A05cSWjiztk1cMYhsV5WPyaDMnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VohCfQdI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ix/ySmlD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N7WD4X721346
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b+8jCZSnA725645bJCGnWztTQrVO6H2b3/VrLHIDxkc=; b=VohCfQdIzABLDJmb
	Fw038ZU0I0zohd5ZrlgbtoUHT0ieW1PFZXc8rioSQuz7MeTDwfTB8XscACuRc/Jd
	nUaOZ1g6xn1krs6hx3IM0wp/eoG9ZHT6JBAMYLidRoP8ogNZ4Ur4cdUvm3vABeex
	pTlCGPUjnNdVbxz/D0uiBmYgDN5vRVENYXBOsPjyUdHCLW9bNPLCywWZlhPxogmV
	Sc/qCB7kBRTt187PfITDacTUfcuzXjy/1e9A36D3lhB2joKKWdOkQhCUEWwlxQpg
	+31mliVns/XJIeAz4EjcCJYUyxRRVKgBNEJ+GOwRRkVWxgzmgJEJuZ0nCqcO78Rs
	jtFvEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wbc2qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4817f3c8so3650779185a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837586; x=1772442386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+8jCZSnA725645bJCGnWztTQrVO6H2b3/VrLHIDxkc=;
        b=Ix/ySmlDqmkfh7DkiNWWJXqoLEgprGZBCux1nrF3L1Z22u8v5lSULD2EN//vavinmC
         K3OKjg40n0FNjzBT6y86d2osDvBBe3/Pyj9xwX6KoIeNmhYXnSBCggnItXS4t7utT56w
         duB3Cu9kXb/XKyTUp2qrL6mlHE717TROCdxW/Wq07T36m6fIP5h+0q0T48LEadEuUgaj
         Z6r+Zg6Rjpjobdff1RaAAsDcqWwitNtJfgtDRuWjpCVr4wufZAvyQHkBy4jQBp/tMRaf
         mrtfHydNKKw78qXNboXGMYp53BCRgGC3GggKcYqTA4rFNfP6pCtXZtcZD4tPAKWNQvml
         6QtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837586; x=1772442386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b+8jCZSnA725645bJCGnWztTQrVO6H2b3/VrLHIDxkc=;
        b=kM8vnbNCRX8N7YD0R86ZtvPenY/dPaRojmEv2pZ8LA3pYbHKRapdKAV5tBXn0fNJg8
         p3nOzDEskvf8vslgMOfwP1xoB/Tsqh7fu2VXn++OPg1wHA56TxHzXc9fhBqSRd4kJN+y
         LQq/AFSl+g1HzZW+KvPU3o0Rb6OgzkGQxZ0JCKokwhkC1s5yCAHxRb1T4YVpDWc+9c/V
         KE0u6mKo23ajv6stHR/8FYuTxvJjx5HzoAY/A2Ml5ICQBcwHlwQzMMeNhkVqiswn7XG9
         b9zGFZbtwAYoaMuHBWYCzPseQPMzy4LWGG616rA9aa9UD5YAWI6rHWXYuOAmh2GKbenD
         kWXA==
X-Forwarded-Encrypted: i=1; AJvYcCWHzZOGls41YOMofbNlQ4TGtJTfXHJR0uNQ/+f9Wg4Y0qwCq9pjbJFpi+3Yjqz2tWCRXg3Ye/IIldJHDrHfuxVhDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMNjXTYLIZ5dJnWF6VL8QURh0O+BnuHLgUw3TTM0Q4e8PJhf2/
	YMb9HSxmQgm+ky4QfvhBLnyH+Vyju/sR7Z9x5I96k3DSmkAAXvQs4aq9/pK5or8i5unhavWMa9Y
	sCe3g2IF+DNYZCyU5bnTMc4otFFRQh7ZRrwBk+Xh0km2hWmyQ0M22M8VG/1YVOuMeLMfwPcZCOw
	==
X-Gm-Gg: AZuq6aJuIbvMnZv3oLgONPjKBqKXuqIXh+WWp5QlmYcaIkkBfdEwJvLef7usUMtYNPH
	4GPp60vjzVlQ4m5DduGGF4rFjEIuYb6mKLkYRKohWcug3/MJ/dzCBZc1SVsjYvNC98yJTxvKkxs
	eKMQVCqvRhV+i8hntFNbVsQYu7x+WviPCA0nlLg/MpuMIFZz/drlwI3SFw9z1H3omakxOVE+gKs
	GooZAu2gxpDetaBrm7BrkZBBEnIuSwb2DJ0p3WO07mpBhOqbBx7pAKmve2jREOCdQp9VMoV1A36
	4MYI8cUY8h2/8XmTMdBCJRG0PacgVWeYOGBIaMnxct/kxOu8lAyZjXqTnSy5S71GcOah+a6Uixh
	zLrhKxlxm46+m8VqyCLF1yQwcv5mMNuvYlA3Ld8ePfZtSl2hp66xK
X-Received: by 2002:a05:620a:25c6:b0:8c9:f996:81f7 with SMTP id af79cd13be357-8cb8ca92ba2mr819918885a.81.1771837585714;
        Mon, 23 Feb 2026 01:06:25 -0800 (PST)
X-Received: by 2002:a05:620a:25c6:b0:8c9:f996:81f7 with SMTP id af79cd13be357-8cb8ca92ba2mr819914785a.81.1771837585240;
        Mon, 23 Feb 2026 01:06:25 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:53 +0100
Subject: [PATCH v2 07/12] i2c: st: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-7-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=999;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rx2dtWdEbZEet4K2jCNLxIpDHbio19pJqqBXzjxrlr8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh352YX7S+FxODzw031A6NZFNXTTScBQL802
 bH0eQGAhDqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYdwAKCRAFnS7L/zaE
 wwkxD/93SJI2I03XT8QYkmz2qqEK1l9t+/u3zcfCHXOkN4VxZpbr3NNH79eKM4Izeho/f9oZSlt
 hpXtbZ1986gfzwMjem3xOh4LrMM5uwhAkYvTyq4h94Z1kR0U4CdqMyz2dFTrYQofwtaEaq0QYtW
 2UsClAH3A6oAmGMw84nzOkOWezWyuWVxKZu6RV7ZQsu2HqHBrksHdxpzAj07PC1rIUIKlIzWeMd
 Gu4R+nGnEsYBsqvU9UahVeDs/ElVSq+sMVG04A+OpeDoih7meDq8ZksVqmkY8aS6MbPgErpJ14r
 rfdmmPGJ3mPF/Mh4pi+uFB3sHnbzbQFg/O8iIZLC0uwQt+5BH8WIDZ0NT3m8EVRfT1Rbmn/Dpk/
 O9Jr2qQugx4m+eo3nFBu/ofAUZ6ode1AkJY10UDo9PneFzFVwYZYyIXmGK/AjWCe73SSYxRjqHp
 7iJNoHcpQ4MRGF0MpGRK5bRPzXF1YQOJtZfABHxUlTVVeBrYthBuFfzXcSV9riTNnNnMATVbp6Z
 IUghQTpX+9+gwWg7mnnANmCyfmulcIHi28C4mPCjS8U4rx45Sl3FDmuowjI+94bcn+XCPmgKlhx
 SFf6HkYKbnTMk7XUh1wNeWm1TMpJhvYhbhvaZ5Lkq3PUnPnLuKmuGtFdtewCOPT+JqzC8AkG8SB
 Wm+qW7Ou23eA11w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 9EEb8CJqh8WZnuNR57svpyypmIQJaWuY
X-Authority-Analysis: v=2.4 cv=UZlciaSN c=1 sm=1 tr=0 ts=699c1892 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=8b9GpE9nAAAA:8
 a=EUspDBNiAAAA:8 a=5jvZOilLG3lo3iFWl1UA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: 9EEb8CJqh8WZnuNR57svpyypmIQJaWuY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX3cN1wYc5JxGp
 SZwVMF/MZ8Sn7wHdTaiJyih3YgQ2TlJR3yQ71iafZYmRjQsIBctAfpO09OEu6yxACYYu4m0Eek5
 U+Z3IDOQp01EnwMZSO2yIml9jb6RVoaEGQIqcMia3tc210MUn2ckWU2TFqDmXao3GCxq8YSk6a+
 zn3cYVLwUwielFSZuFSO6ydK41u6lcegX+MoynhGEMBfU5bxzvh2yUenXxFUeLh7IzX1K0u2KZZ
 FhjOEFwj/9BDkOUveot1LhZhLkSCks9RnrJijoPJq7hVjLRRBQgmdnu+nIHgYvFpZBbGZEfwtZH
 xu4dAmZ719O4Z6HGuIpECZYWDrX2LOupk31P6r0YDFP5B6mlayDLsVh3SEER0hssSdaTJc20GJ3
 YkbWpGjkHNaeBma+wvwruO5/20FjKBP2blW/nlRCEZ+/4Xm3Hshaz9c4wMhnGqU//6Lkx0DzmY6
 q4BjroJPUvn5SYovmHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28367-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 45F8C17398C
X-Rspamd-Action: no action

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-st.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 751ea421caaf388bc2337026e0860707823546d7..88ee5dfb55e469b64537694224a0fe39008a80c2 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -850,8 +850,8 @@ static int st_i2c_probe(struct platform_device *pdev)
 	adap->retries = 0;
 	adap->algo = &st_i2c_algo;
 	adap->bus_recovery_info = &st_i2c_recovery_info;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 
 	init_completion(&i2c_dev->complete);
 

-- 
2.47.3


