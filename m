Return-Path: <linux-renesas-soc+bounces-29488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAcYJr8JuGkWYQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 14:46:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9DD29AB3C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 14:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A72D03029766
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 13:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35A3226CFE;
	Mon, 16 Mar 2026 13:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cczKz4pH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGroW2C4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C915C39A818
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 13:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668754; cv=none; b=MXTVViNQ6Kdu/dvQ6xqq7Cv91L7g67YXD0aD3bH7jLdC/vxsNaWAv4Qr6XcsCfA8ccVbZghze1AEuYfE8iOOhiI/pN6TppoEhOfl6mpr8IBBljmbOADg6aJOdypMibPCSBltahqQ0anLG8c20ax1pD+Sr+F3grYSsDvLOwukNP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668754; c=relaxed/simple;
	bh=ucyEDeReqWNpGQZIqhHybIWLSOoxO8g0TheUwxSiVWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jG/SzbiCEzyKF0YdfT6ZDDr8iQ56BIEd6BdSGupBL5CDB4ixog6TpXhrwC2mLl0sprY0G1OoA5PFrHhhK6r9Bs/Nw9z3SpT9LH6yXIweoNW9tF8OSZWL+DOQWYtKjYCHCmPnfVWc46rBzoydGW88xOU9eIGR5/uW7hs5aTur+fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cczKz4pH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGroW2C4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBjhul1428764
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 13:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pjszZMZGsG9
	Y96DJzuffZhkM2Caqqme43k2OCWF7lvA=; b=cczKz4pHid44iuAUSJMfk0tLE6S
	dxMWrcp5DPRlQmk/vQc9bi8cs1F5cwM9rBZGWEGwSPdO6mcu5c551iTcrWiwTjNL
	yooTxGz0ZELOtpwNwXUUPOjcuuw/ihENxm36EIpYn1TQKXRq5tc7Td5krDAdCObB
	KtB6O4loVqPr2tGqjrQ7ONes6yqB5RA8Z4AcDqARBuCstitvbPMEsRkD+XKnjgMO
	csiPlZALCVqKqroEi/hElcjD8XTr0KVC336PCXNTj/h3eXE/DDLjpZZNMBynhVm1
	WByVmZafiULv2PritFi3JG2oSWicoyX7OOpPhLjIh8bJONOq6TwySJtbNjw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxh998epk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 13:45:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd81c571a5so2954025085a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 06:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773668751; x=1774273551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjszZMZGsG9Y96DJzuffZhkM2Caqqme43k2OCWF7lvA=;
        b=gGroW2C4d1SQmtU6fG6FJeZOgwHbTwNB/+stBOy6bsKAkQCo+oobE5+b3TdkDG2Kuv
         DcYUS2D7f2+fmNtLZh+OIf1tlGaIZaNadGvCoMwsROzHhnQtT14FlZmnGGPU9leTGupl
         s/teQLcEROk71PYGvsn+yHKAP3AjN+D/qw/w0Q5/SbpDwYa4Q6gJX6PlXAoMkPVp/E4m
         Phebo9IRzKW8Tapti5X6kRemeppPXDWJvUG9mRDWo5BJWArGvIY5X2yV23MAg6FlOb6L
         TM9KhKRI2M9yvOV0m1xnCEYLuTQlEROKs0CbyjVuGceAmTIaeU7U3k+XTr4o6pARPDPF
         hdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773668751; x=1774273551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pjszZMZGsG9Y96DJzuffZhkM2Caqqme43k2OCWF7lvA=;
        b=dPxl3COy47fDnCsUE2v/A6n2X/K2Vw6G6YNr3asegjP/w7OeQDSl3cghYokdetEhvn
         1fq4qhqnHrMFzYYwuTvQFQmrorE1ZIucCkd+VvsRnlyilsQTBRU8Ho1y5F0nIxag831X
         aC+QSu+PYMhxHIXCKZrhfimz/EuVEGdh8IErLp7pIrY2nEeEgmdCmbISm8cAmIHskjaj
         5ICcSW3G1BoUhN8noGWlwn9+ef9xuUtTco10CuA8iha90kaIQGe2rfmcXK6hDNYjqaT+
         mD/aIM+clX0O0o5l0jYI0b5xyvmfBUPZjtUulZ10Y1YmhDQ8hW93aB/E9Pu0NBd27WR0
         0I5w==
X-Forwarded-Encrypted: i=1; AJvYcCVEHfJMgtpqNltKL8x0tce9JIllM40X/piN7Mwp7RiI7gjMwiwq8uhDWTf/D4klN+Mdyy5u9KNo/Wm1CNTtXmJ1nQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgw6iDNDHqWdRmzvSQ/ph0BUNa3igf0VzWq3m+kKLBqEbB7uzJ
	kr7RTIWHmg5JRg+f/43+fG2ZqPJaS5panTyUbPx7j55RvGi+/r6iF1w4yhuJocKrLmsSdTpZGnp
	FrxFhcZui4ADkY9r/nGyeaAcyQH7Z3Fq6Zud+5hX87IAA/F0wJROzE2fGtEH+LjZs9a06fcv6IA
	==
X-Gm-Gg: ATEYQzwZyDaYZ73QoDdS64lpV42JFL9hBhEWhnfkbZ0uPBqZ4CnLDQE+hL1q4YUBQOI
	rIvmPrTs4nBQg9IiXwhB8p22YREliGZua3suG/foLVTzwhMbcPULjwfdXhP0Kx1+AcaOMmuj0Vd
	vrsxYH3yrpBTzDB5d+jaiGgZWPEW4ihAFOBFwHR8FFLLDOhnMH9osBq/AKa5XqniZksBzAswDbf
	t4FbcIGT9Ltt5Sng3ZVF88h6w2RxEebwHNSbfTuMrlJ4rWAzkcoNC8bv0ycrLQv6LR2Jy2ND+QR
	yndwF89T+IJejeU4ilWuRoe4s7jVv7eKZkFHIKc21ih0U4E0m/Zzw3Ml9kh3Fmgs5TrjH1dF89C
	sLYLgicWsP3NujGL1z5Y0Rkxhi3ceBOzIiLT+
X-Received: by 2002:a05:620a:1724:b0:8cd:78e3:8797 with SMTP id af79cd13be357-8cdb5b4d4d5mr1640078385a.47.1773668751005;
        Mon, 16 Mar 2026 06:45:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1724:b0:8cd:78e3:8797 with SMTP id af79cd13be357-8cdb5b4d4d5mr1640073885a.47.1773668750476;
        Mon, 16 Mar 2026 06:45:50 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b416e3678sm14307231f8f.17.2026.03.16.06.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:45:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>,
        Martin Hecht <mhecht73@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Quentin Schulz <quentin.schulz@theobroma-systems.com>,
        Todor Tomov <todor.too@gmail.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@gmail.com>,
        Marco Felsch <kernel@pengutronix.de>, Lubomir Rintel <lkundrak@v3.sk>,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] media: dt-bindings: Drop redundant endpoint properties
Date: Mon, 16 Mar 2026 14:45:35 +0100
Message-ID: <20260316134533.56941-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260316134533.56941-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260316134533.56941-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2502; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ucyEDeReqWNpGQZIqhHybIWLSOoxO8g0TheUwxSiVWM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuAmAMC9rcTpoIVh91l3cJNZCEepRHmCEXu5Ff
 L8w5uVvHz6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabgJgAAKCRDBN2bmhouD
 14Q4D/0VnvYMbCWgKNOD4wK8BfRRaDsoIEY7YSMxoOXeR+sUzYHvRi7WZJb8iztJtBvcviDi8xZ
 U8OcDeEabOI5t2mC2FsfXmW57xGZV5jOjLrVh6twv142lZlo9t/CmvcJ/pZvBhy8II8kR2kB0pA
 s1c56G08Z985U5Q6BpQHQJGnn72x16+yoWeNniYLv6+9gG0pZXHteWNkCK4n7s2pGxOdoMad6Wg
 dCGlcnDQTvcVAqEaW3hlAs3AEx5jPnBIksnN3aEkZoGjX/1aIS5KIgZJTzYE4Lggv6BrlBQsoo6
 hd5JoZS/3LnyVTIA8j10k+egwl8xrsaxdpkjkT/UcaNIYX7jzs1Ra28Nl1CpmIFqlckKyPNsLxI
 j9/MHaFBL7e0Dqft1HySMctvcKIWwgx89m80JNEN4jDBFOyLaAs9Gh1Zz9wPFW7AEYFQfN+PeOp
 UFJ/WLBajabq4s+5azzR4NuRz/Gvoju3lq6pKIDfXZ1e+i4w/8PLgpgTbhZsBDg2gz+GxAwYR+o
 HX7+2t45IqgAANdyYqVVL3Oi2YTTB82XEkqE/Z9BdkvZe8LuHZ/XADczqF5RbWKaJhXn4trX/Va
 lt/mmG7amSFTEcYufCG7gOKvlxvAwebH9Ttjz4BOuQWNI0pC3o2CJv4JOEje0TgQnFJcIWUGL6M dTcJ1O58IIsCftQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RJ++3oi+ c=1 sm=1 tr=0 ts=69b80990 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Y3ovHfS12-kTIQRtp7wA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwNCBTYWx0ZWRfXyzTzSujq8HKW
 3AMWBdT0oGSGWU5X4+fRRq4X0ZfDERNB4shS0Vu2qO2feWPT7a+9g5Fv3wW5/48zvKuHe0bq7jk
 zlhObnJgeS+IpwiHXDNwaDpmXNWl3xDo0o/Ql6M1RbP8rAlhUctagiFdFl+eA0EJzRp2TBincNf
 9wNlXNS4o8oMuCXgv+GuaHMGkaCQZSA0dqF1VEcVX81R2C2ZoUsiPFpNRfMkYhUgO9h3moZVunY
 3pQPY3pam0yyTVMpGQ9T+8MtWPKyL8AuVn256PoWSabaDCqYO30m/MnUlYhpm7OqbGsHznm3Unl
 GjlnxbEzTUtQksKsYlQBP2Lz14tZ81bG9wcBMsDv7Q7eNqavBSx6hnRWxijMkoFPScF/TI2LTCv
 UywxEvnuNE1/Gc2ubsA1u/R7U5tR6r0es4aUIaSQpBWudpHpCrdOLzcyIZpoxOQof/vPb93CZWm
 zGL/kVLpIFFBb9P03kw==
X-Proofpoint-ORIG-GUID: uW6bV5nSBw0k7tIivGz8lQK9GFTJGN6f
X-Proofpoint-GUID: uW6bV5nSBw0k7tIivGz8lQK9GFTJGN6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160104
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,foss.st.com,jmondi.org,ideasonboard.com,ragnatech.se,linux.intel.com,raspberrypi.com,glider.be,linaro.org,mediatek.com,bootlin.com,theobroma-systems.com,intel.com,pengutronix.de,v3.sk,vger.kernel.org,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[31];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29488-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3B9DD29AB3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The "endpoint" node references video-interfaces.yaml schema with
"unevaluatedProperties: false" which means that all properties from
referenced schema apply.  Listing some of them with ": true" is simply
redundant and does not make this code easier to read.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/media/marvell,mmp2-ccic.yaml        | 6 ------
 Documentation/devicetree/bindings/media/renesas,ceu.yaml    | 3 ---
 .../devicetree/bindings/media/renesas,rzg2l-cru.yaml        | 6 ------
 3 files changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
index de3e483f146a..a8bf06108158 100644
--- a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
+++ b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
@@ -35,12 +35,6 @@ properties:
         $ref: video-interfaces.yaml#
         unevaluatedProperties: false
 
-        properties:
-          hsync-active: true
-          vsync-active: true
-          pclk-sample: true
-          bus-type: true
-
   clocks:
     minItems: 1
     items:
diff --git a/Documentation/devicetree/bindings/media/renesas,ceu.yaml b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
index d527fc42c3fd..5f78c77b10a3 100644
--- a/Documentation/devicetree/bindings/media/renesas,ceu.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,ceu.yaml
@@ -43,9 +43,6 @@ properties:
         unevaluatedProperties: false
 
         properties:
-          hsync-active: true
-          vsync-active: true
-          field-even-active: false
           bus-width:
             enum: [8, 16]
             default: 8
diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
index 47e18690fa57..c1b81416bd85 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
@@ -95,12 +95,6 @@ properties:
             $ref: video-interfaces.yaml#
             unevaluatedProperties: false
 
-            properties:
-              hsync-active: true
-              vsync-active: true
-              bus-width: true
-              data-shift: true
-
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description:
-- 
2.51.0


