Return-Path: <linux-renesas-soc+bounces-28369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MM5qGRoanGkZ/wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:12:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 048E81739D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B51683099146
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB82A3559D3;
	Mon, 23 Feb 2026 09:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+hQ3JvF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iut01gO8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA92350A3B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837594; cv=none; b=XjpmVkaPebKrn52ktSh6CrPdZPvM6HdKxYoM6YbEcjHQinj2H/ryNqoAajXVY1pMofsD9tMpTmJqBPDF0+hEoiGAVYBTx6CGYKXqE16kTuf3YXO8O7NnTHb4LLObdv7ItEQQnoY4Nd7cQ1OR54qLxx8FdEOlDPMJOsGplVxqmgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837594; c=relaxed/simple;
	bh=hWDFhQnaic3O9OJ+7xBky9bkVsKM8N71b8pq8QsprJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=efI85vAWOTISSTzLYXBk8pHQOMR5LoVAb1YRAtU9VzxDVJ/exgZeobmG3j089Ghnl4hL2NsvHl4/83xt0kP5ZDqxLp7q73BfJRmgDPeWoa96DB0MioKEZBndPSIpeWdwln6LQSeK5eK5J85Uz/e73HIZUu3PZwwt0O4GdnQAnkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+hQ3JvF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iut01gO8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMqpCZ2237018
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxTiq2AYe64lLLAUHZl3DZa+lCaa8taLWHMJck+srMo=; b=E+hQ3JvFEHwHYKbc
	pv5mrS5M6p9RS7DuB8+Ae3lhQBzAQA2xl8sj+Jg3Z8qaprzl5tXAAxm4piJP/4vN
	WGTJU1PJcxEvqetqd6bAnr0VbEcxLVYgSK4mpXEe9xfzOe909+YGm813DObXoHFR
	4A8b7MAzT6NtW/cfU/2vNGkw4S8HExav65vsSs8BVRgQOUd5PY383UBEqB8KWIjM
	K/3jv9c1NCCk0H2NFXA1DTZv9yZ19b6eecTXghp+zACUfp8zmSLAzgF/zNJA1C6W
	+9TnGj7FdUY9foDDk6ZdWebb/xrnuwop89pVpxNx2VPyHcQ8s9/9oj/GKrjZqn2o
	mFYEWw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vum0hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ca3ef536ddso5088299485a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837589; x=1772442389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxTiq2AYe64lLLAUHZl3DZa+lCaa8taLWHMJck+srMo=;
        b=iut01gO8YGnO9ZOovxTMQHxRLAgETAPnTrhgx316tnjLgBwKl5Yv+9FnY9shyWvrtv
         kleeHqVHV9krBe6jzlY7lBQ1Y1Tk+n+fBKeNxXEF4Ja3WpFpc+K824KNqDs1b1Pqe76V
         QlDS66r6wdK7bqJQ0ro6Ydvfqfm4/kPkDLNaq2/eE4MYU9poMJdVJxchV7kmVdLkAmLM
         /XOg7jaQM0NY2wcMd5QyoXpW5MG+7uFbu0gZuW1hbUm13LXksDdI6QxuFOI283eGf9S4
         9qxEkpA3X3mUvVyoZGAnFvJRV+VNcsDnm4C5c/y1hocQgfjCde1H9uzSMcI/szVp6OaK
         /pWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837589; x=1772442389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sxTiq2AYe64lLLAUHZl3DZa+lCaa8taLWHMJck+srMo=;
        b=J4jCl89TVhwwmh72ZddoDuWObVvUN1iYlyMrC1wLnWiKVXjP+gGojimMhH9CI19iNZ
         LVlDRh8mSWBXLUWtDOnQGOddrLy8JqFAXmnUwLJhNc3bsLiSf+WBsukpXJSCWbLEHeMO
         FGffCNX3p5mpWkGQgvChsluLyKQapR4VscEYYx+NmLOd+VwI61qw+tuc2vnk2Rjw5LWL
         261xuU6FnKxNYRIqka4/PDnSmCvxqxgaFokbrmQbdLZwPDESC/1GsFN7yMwGMCFvI2g9
         8umXIcpMceTRDPNE+bskIP2d+/tp0mATynknHFxWvgnaDC5Cv6uK1GSnGXUPolhADotX
         ad6A==
X-Forwarded-Encrypted: i=1; AJvYcCXUVM3SS/IGsg97Jdm6iORNzgSHPPisXhudD8J4kZBd7w9qk+aXkS0kdginBhWmP1oFemw8Azc5Enl2odtzpHt/fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7HKEIlzTXTi+WAp8sepIKtPdMdOKT/CmDwqjVVSsf/rOwFQkG
	WhA0ueGNA3ctbLuzxjx+wT3q8X9lbfWW/aNGLSUSYDiTN5AX/CmuoOeA7SDo/yFcSXLY/e9VEgq
	Y7EhjrsDxO3Tn0H0xw/3dP0uhT9SjWHhk628QciITJM+izsWiPjqDhSC3BD3JoywA+kaqJOkUlQ
	==
X-Gm-Gg: AZuq6aLPx7zhVzd1tDT8HgMxEjGkvrReJmyxLS+Kkoh4P8BoS6YGLGRJWzfm/Rv85Y+
	78naCoCDVGBcfu9LyzJIbyD8LYqsafN7Zu2ncheC2kJkebvs4aCROEkwzRvpyq3/kgVFnektDZt
	ZTg16dl/Tg0B3qkEAqBpyaekzeM5vNXDcwFZ/dJ0UGjuSv2k7ypf3HiurbykO+t+ltDe/Ay6uE/
	Ec7ogT29//V16SmcBYtWr8xg9QJYeJJYGT3vYQLBDZTVRc83yVtW89Rd6TG7eWpQ/5eQIWLfW0E
	gLU7Goha3D/+fCnfxiH6NdGOZgcxfKH4Rj5DDnrf59tNjGuYFL290LQHkbQKYB0FOH59WzIlHT3
	5K+qAA3UwY+MkppI/lfK/8bLsR3OFRCvkcQ3TFyzpydqa7lCKT3Md
X-Received: by 2002:a05:620a:4482:b0:8ca:2ba8:b988 with SMTP id af79cd13be357-8cb8ca65b4dmr912584085a.41.1771837589421;
        Mon, 23 Feb 2026 01:06:29 -0800 (PST)
X-Received: by 2002:a05:620a:4482:b0:8ca:2ba8:b988 with SMTP id af79cd13be357-8cb8ca65b4dmr912581385a.41.1771837588893;
        Mon, 23 Feb 2026 01:06:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:55 +0100
Subject: [PATCH v2 09/12] i2c: highlander: set device parent and of_node
 through the adapter struct
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-9-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hWDFhQnaic3O9OJ+7xBky9bkVsKM8N71b8pq8QsprJ8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh48z3BkboibmH1Wm5hR9cELzIQeY9gBcPhA
 XDQCpZC/W+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYeAAKCRAFnS7L/zaE
 w5AqEACIw7psY67E89Lspf3feMBKtg+xFiREP0W0czKsXM3vtcIITAdfDI0jRpTu+aSyUewPp8e
 KJjez4TUVKV4nNiXmDwJi6M0UCUA2V0QahL6WJcw8/BPQ4QAtZ5ir3HMD+4CJcjluUY4097hDSW
 9Fjpdee8Oicueou0j8qlVeYbmqHNCb+/aku3i5mGfJFeSHX3Sh60fbMYmi5uaAcbhn0OEMjtCGK
 iYfm5S3PwpM7an8haNt8+gCbEPClUjHACQI0RK7bNA0opZKywpaqgqa5OvgQrItTa3Gd85FeVOC
 U+O7MFzkqK6DkA15t2vFJe0hZTFHqa74NaCp0MPtS/URE21WVkveFwKET2v7dqSBnqEqIEpTW0v
 WgpJAKSmWavJKBTxjzWJ2hXl6I2IgRFPIMMlmRdaMeE9Cp0KbCRiRyu1UEG9kVDAw5OcXXT1s2U
 DL3/nMpneTmDfrA2HNG2/oHfwCJF7ENgimO7iaKhQswzkOhHIbTn76bOAAdIFqzi7XbUH5Ktbaf
 tB4cMeyLTOEejdtwROxxpdHvybDHpn8kh2/7AWTTmE7AclO1UdFmJEyUuNbfXNkOLhiYZaorNLq
 9mCbs7DTVeOoyTV5D1ciWuVlGFqIb/K3gk9dpvSy/IJQeq2uiO+zUBj5PvrTfNYk6LU0agk5YME
 Pcp5SAOWlKAS3FQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699c1895 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=hPzHJ5MbA3fyhucrTyIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: KMkC7yAd4G1etnxQhWbENJbXrXXJ0wvz
X-Proofpoint-ORIG-GUID: KMkC7yAd4G1etnxQhWbENJbXrXXJ0wvz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX5ZNxS2uJO2j/
 H+wPfK29YGGzHGTW1eKYzYBs99kgRuT4ZgrEJ3XhKeRJnTabDVB6elCTwp1/KitZiROhojaQbxi
 nHmIIOlIy7wa6hJiTJ8EpzFYq+CP2HXcsYjB1vx0wseGudFRjsVNGvakpb2qJ7vDykNfFWdtIqA
 t6OcqRO6+ykoIMF/CVbz8uExfTsv3rbj6wFUjD1f006kKKH4pUYB7cTLMfzekh8sllu/NoII5HM
 uFWemGgOTAsBsoAtAnUgd0d5fCeO6EFJqvGuHK/RYAYcVq6apQgXurZ+UME4EYL65hbUHSyFLCI
 86pFz3Q/7FjGl4SjGaxU/3GtYW9yy+6b+tcutRFcGBfdncmfEzXF7jW9WIslLa63oKAQTEIjiDg
 o6u3/4SHLjwufdwcDpF5YREwxi/hjHdu4t+Ut7C2EBjnYZbbm22iQ6LaqO+cUcms7arb+apjqNP
 Y81NVQIB+RekieWFBMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28369-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 048E81739D6
X-Rspamd-Action: no action

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-highlander.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-highlander.c b/drivers/i2c/busses/i2c-highlander.c
index a53b4bb7c3c0487ea028453cca6d09f6e4a993a3..ff30286efaf8df2895cd772fc554aabb85c5a998 100644
--- a/drivers/i2c/busses/i2c-highlander.c
+++ b/drivers/i2c/busses/i2c-highlander.c
@@ -404,7 +404,7 @@ static int highlander_i2c_probe(struct platform_device *pdev)
 	adap->class = I2C_CLASS_HWMON;
 	strscpy(adap->name, "HL FPGA I2C adapter", sizeof(adap->name));
 	adap->algo = &highlander_i2c_algo;
-	adap->dev.parent = &pdev->dev;
+	adap->parent = &pdev->dev;
 	adap->nr = pdev->id;
 
 	/*

-- 
2.47.3


