Return-Path: <linux-renesas-soc+bounces-28363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKf1MrsZnGmq/gMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:11:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3577D173943
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2A9D3072A22
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953F334F498;
	Mon, 23 Feb 2026 09:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eadl/oy9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Of1u8yon"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D400834F46B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837572; cv=none; b=ap4UhMqeBeZLd5ZYb3/KTIeHRbdziDsIqdJsKpSsrxmPdm14CvcnYnL+mKs4YfiElfyMFuqxy2jMCUo68q9ZcVd6VDm0lxGilm6Lwd6V5tbCdqAqd//5LW1zo+dr4Ugx+YLwF+7I/zKHyhVglIxN7BNFBzoawx5uG/dawmD33R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837572; c=relaxed/simple;
	bh=q14XiC/EF5mMq9yShl9lco+1y+s7ckLltoYVG3d8oSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CcL6webFjzN9U6Pu9SALHGVCqOD9PbWKoBsvsvQDzFdHX/yfLyXI5nCMrndHY3u9aMD9zgBtC89vqbvCh+Z6CVENI0yFz2BVL/9Q3uPzP2a6L00E2bLZHnQYO/KDWdfegqBDywTITR1Q5ZzsaCkJkBCCt3ICIv8vLows+zLMsZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eadl/oy9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Of1u8yon; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N8hS2U766639
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tkjt1CvCdql7jbfT8ajkPQtzV1KFX8BJmrR45NSdjo=; b=Eadl/oy99ixX+Irw
	Mw6rBWyk6+0xGz1YjnhR1h83EMiNdZIX61oSYTTgbqwlWVvuydiXAN2nwiyYQj0e
	fGncTBKLgHakQ+3yxzp0lnw0Kqv2Sa3vY0+vv5zMo7MjSEhNctdPK4fYF5K0I3km
	j9MrnaeP6avPVBMTR4etuiHed98B0OPmXnwztGhhJ8i8cbFuwrOLU/kLvmTG6y/3
	warZ/T4W15BP2Ig2kh42+Y3ld5eeeU1Wks65Sui/dN2tN0SkSX+44Hung92tgogd
	C9TdcjmUHhhebL4kjsFIyXDrMo+SfoeFDQQ9YtwQC5Rbj+Fgjg0gsVChKxYbbqGI
	5gCSNw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5x7v3kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ca3ef536ddso5087997285a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837569; x=1772442369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tkjt1CvCdql7jbfT8ajkPQtzV1KFX8BJmrR45NSdjo=;
        b=Of1u8yonSodNzK7Y2NpdHM4uXu4s77VFSbLvZ6Qm/ykAPSDF1FYRMQ3EEJx2sppvC9
         R94FG9L+VJ32ssr9yStWVRfli+Csz9W2He5KOHV5EthQtS8eKwQXBbuH0MrQ06X8cRPS
         mJIaJK3e1ohfAi3ISbPrDAqaRg/zojnyOaiSpWnVzBo/703dXGLEzn4WEJf35w0IsA8T
         Ugk+M8aXDFr4sJ+qaBCgNSE53FfPZ356D9PRv+5l/nUekYP/yNYJ7B17M+SKtsRonFNG
         Ic4DBRxUi8i4IMoH9rKUWkn+9G8U5AObY54APZ8KjtNM8rsYCMaBR9xA+DLBMv9rIOE9
         Ub7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837569; x=1772442369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4tkjt1CvCdql7jbfT8ajkPQtzV1KFX8BJmrR45NSdjo=;
        b=XSwKgb5AvsAPBC/1qCqKxyQd8PDNBmgxrSFzAuv6iVvK8mctZETwWcmAYyyXx5UNMF
         1NLqCdj4grmyD7D2dL+6vnui98dSzf8SfH9GN9N3+/bPJKLjDJB+Xr0vqD3AbIjSoM+f
         Xl038SxbQpRRm3Da4fja9lSPDHaiBuKW1upq9NxAcyqPLtA1OEaCq5Y4fqJjDApSXxbA
         A16UHrRkx+n150dVvxiHVRWUgLNU34NmaXO9JRZK6J71L5cwdil1s5/rq0CnXZX825g+
         yrWbf2In6hmGViw6fAHfIGa16OML8G6N6Pplen4aLAQ5MPYAkOtbrEC1Il5TTUT7IRkc
         CyYw==
X-Forwarded-Encrypted: i=1; AJvYcCWLJAtQM6azSufmVNpoYIZC+14uiEFR2YqeE7Sfvhh9XaK49mUvN0oTOkBAlC2QfJoHcOyC9utP/hv4JGRRTKG7SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1E0IxPMVBC+Jl6CBHyBC016I7+bqR4q9R2uEHjQGDyLdIj1DY
	LU5Ve3BN8s9eqijXZOOlVtNHsetVao4xss+e1v6vleCg2nb3icRNXjdZbOxH+kO7iBs/zyVKOFc
	MzA6CvOv3fTm+Wv2UFk7jAjne0gnYQr97QXaDcbLr8cNSx0js9BERAQggvZBO9bVc8jEOoCkdbA
	==
X-Gm-Gg: AZuq6aL44YB631jhMJzyLczL1P26cg8yKs5o519v0dbA064EZttfUqkhq7I/CdjNnsG
	c3qnTpgyJ62LzgvnzCPGEussHbOFB1VPcu6xFtPH8a948NTwJ/PoBBpaFLK333ry58WvGCan0b1
	QFGnzoNDbvnIZLusI/E3C6LoMPIYdpVzNrGVdfusUCWiAz1qZxDCuE9vWKBl6ls0eOmlYbqO2/E
	7BPy1TGpYF53MvyR7y69gnUxX135YO72mVaGfTReseFBAOYOyyo5aAktenSCvH1xr3P3GLMNZ2k
	XeYrzwDKRXjsDNMe53lfokTNxMfBceyUEv3lpFkMAAt6EYKtufAwrF/+GrOhGrJqp0kuDmiWdbI
	rKupkAPlF2fhdZnurzuvtZvQzm5ePq/IAgQ4skFQvx2IM3WyPx9no
X-Received: by 2002:a05:620a:2986:b0:8c5:310d:3b2d with SMTP id af79cd13be357-8cb8ca03e68mr1071110885a.33.1771837569226;
        Mon, 23 Feb 2026 01:06:09 -0800 (PST)
X-Received: by 2002:a05:620a:2986:b0:8c5:310d:3b2d with SMTP id af79cd13be357-8cb8ca03e68mr1071106585a.33.1771837568736;
        Mon, 23 Feb 2026 01:06:08 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:08 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:48 +0100
Subject: [PATCH v2 02/12] i2c: qcom-geni: set device parent and of_node
 through the adapter struct
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-2-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=q14XiC/EF5mMq9yShl9lco+1y+s7ckLltoYVG3d8oSg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBhxLArCtmmlE4gRC6CeGEzvDnbPvKlM97OaT
 prp2vCjynqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYcQAKCRAFnS7L/zaE
 wynfD/9nERsf8qMwPeM4IonodXdRsy+F64xQK/uJ8mfcnvZ7ZSWSuU3pDRsjoQDv4nAjW8Z9/Me
 SHXKyhu7lahHo5a/SFSde4mbEa/ZxhLn7prdnZv4fcEfiMiOMd8iLOHm/J6KiothsVFfhV5khGi
 7JeEH1JlSiyQsO1W+QsQ/cvXeyYjWUxQg42KyPDMfqn8Zu97Vm+ytckEQNKQnjQ8B8Yf+tf0jnQ
 LqrucTueZ3rYk2i+SRB8fFmC+cSQxO3gfUJCPowDsROzIKHlG6ANnCNw31IBb0KfvzYnqsCm7oX
 id0Plrm1YjxV3inA76Dl4Swu14UqUX8C78Xm41wBD6JVYkfzuewMmNLzCtbW5wj84Y+461lTBns
 ERoDa4DNFoDRhrZlsnivGFpW+deCli/KIqn193yageDShkXqk1E6O8/wMYKMRq/h/JjHml2c6Y8
 mxi3Jty4CDeG2zPkd4Kxs2P7cNUBe07XoM1i9b/X2z38tI7nklLkL/ciyoYbCdJb1fJoT1+z25P
 PUXMf0/Rp4RbJZLzyEwM+2dHiUJLfu7qbFPhUDHiZTjXK0CjZ0ol19qi9OSS8NapU90EqB1KQyG
 StFY/1gRv1rOXL81boZNNJNWLYXe84MuRjktMGzdPXegmAFX5gU0VDPtI6a8CWXOxLHMdHfIUaA
 zBF6WRa/X+6Bv/w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX7wc5C1qtplQN
 HKaDI3BNEeV2pubmipcl9r2cLddu+D30aUybLIP26sTy9wiTfn0qqBp/z2AqewdCAg5N7WGH9zy
 3kPpxfD7jCyi+LmRcUgf+KY9F5WB1wlWO2qp5Z2sGuXSHqO9dDSBmbL1vYlzo8HAHqhmR67hiEo
 IDe2Swv8fSFz66do0wYLNlhXtPgNHXM1Gq8vM7m5t+FK7nK6SmUYKSuFLuSUSTKANdGjrsNhVDA
 IJkxzyGShinRo4wAoxN/oxQmwUvi2s3ij7s15R4Fj+0g3nCCgctKZVT27J+AkEqJkyMS2KsqHLN
 5KeX5mAcjIfcWII8C3m226eDsF9RoBwiLPXRvfIlBxZDK1dLzbMllpn2H+Dh33ox/Jmf8vndtpu
 DVrqDJm1cZv064t6Gsvd0g1mPuaKJeIQQoqXsiW1y2CcgElC97wMxTYfjFn8whBPZUbRrd5El30
 LDZQ0v4E0Hs338krw8Q==
X-Proofpoint-GUID: -BwDkCXcxNxmdiGii20UQcaJcwnOy3aN
X-Authority-Analysis: v=2.4 cv=X71f6WTe c=1 sm=1 tr=0 ts=699c1881 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=GyXxqrRC-9zytgsE6zAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: -BwDkCXcxNxmdiGii20UQcaJcwnOy3aN
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28363-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 3577D173943
X-Rspamd-Action: no action

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a4acb78fafb669f49e71f739764b9779617f0cb5..d930d198518718aa107819cfebadb9e32a1da377 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1039,8 +1039,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 				     "Request_irq failed: %d\n", gi2c->irq);
 
 	i2c_set_adapdata(&gi2c->adap, gi2c);
-	gi2c->adap.dev.parent = dev;
-	gi2c->adap.dev.of_node = dev->of_node;
+	gi2c->adap.parent = dev;
+	gi2c->adap.of_node = dev->of_node;
 	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
 	ret = geni_icc_get(&gi2c->se, desc ? desc->icc_ddr : "qup-memory");

-- 
2.47.3


