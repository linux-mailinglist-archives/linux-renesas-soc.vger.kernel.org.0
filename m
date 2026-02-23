Return-Path: <linux-renesas-soc+bounces-28371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIiFCBsbnGkZ/wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:17:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A10173B21
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC3EF3036ED9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817FF35BDAA;
	Mon, 23 Feb 2026 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ks9LgQaZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gw95vzYO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78D735B136
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837601; cv=none; b=f0DJm2fXBLi92+7DjPXQC1IBk5Lune+jIa6BhxFYL+jiBoJVKDAAQTaW2pLOXbUdf6ycK2ccaGaDT1G2qneH9S5ly2CkAd2VyfF8QxzP/ypYqnEN97s3OZFSIBOmjn28/CW9WCnRWXZmEh/w/MLtoZgDKH64gYpe+oB+g2OIDOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837601; c=relaxed/simple;
	bh=u9n9l0NVttKMXo8Cm/QnZobv6JruCHoppeN1fvpKWko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CRAwp27+ifzAtwsCPfykghqkEJTbbsB4bKX69hKUo4Aexlvy1yuVJjEp2UiPk8Cl3a3Wfz46qwGxjXZQtjgKEtWyvB3dAOXZOLoZy3gLxpd8f5VnBT65EsgCzuv1gPwkooRor5dsbfUVfVxoyyaILbC1Aw79cJmc8TNqgmBbkJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ks9LgQaZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gw95vzYO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMkwpe1483271
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=; b=Ks9LgQaZ3rISUUiB
	UPhLyg/wvHNrMuQ5MWGAkiHx0iTOMmkXYe3Oz/aqmkvOAKX51jAY4jDR0H4ZoTL9
	u3f8F9FGGFVb7seJ0dt4qNmUb/HHrL36jZ2fKTHhNqsTIv6HNKltCodV5RFZRSoF
	IeGKpz/KS4ztmolA34vbLAiIibrhLpIcBlIHcGo9llC5ajpnrOWXzWr+PkFnC1b+
	9g6P/WEhspfqn4px8qqJ0cmtjRLXgrYitdoEVqVNtMcSPtixCMNKxHw/10/QXYY6
	hV+QRuOd+9Sl3vBXhlqaFfuKPPDX4cVO5T5OpDBDeiIGS9wYL+6vHU35jWCqbSw8
	9V6u8Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5x7v3r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3ad1b81aso6422648685a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837595; x=1772442395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=;
        b=gw95vzYONNCteCUXzl3Gp84NeTEEcbsXinpAA/yQq/Eu5NrHEnM7KMukZI5OhvoGKA
         64lOaa8p+2/lna6ezxB4riqRbcc5j26LzR3q5QGTtimh0Cyrrc86T1hiVnuZlGm2mMBp
         DN3n5+Ml5Ym4YD76tFXOc/xX24KSpu0UEaUxCbisGV1FwcnDmTm7pPjlitSeA/Ys5xoO
         25rj30K8U5hpHsFOhu9VyphSaoM2PHbo5njezdxBnrIoxedrnrpWycches2++11x78vG
         a1iXf5pTuNSJCnD8eufLCEHR0l2Lc35QSgESoG0kKYt/db+0+ZOziM1ZQTiWVaLdrNkh
         tAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837595; x=1772442395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=;
        b=SknbiVd0C7A4AeigHQLaQSFmMPLwmnCadihHW+Wq3vI1sDRNDvY+ZbDci9T4hmxxYr
         /LfaKvwLDb+gBY7vfllVeJr4LWEMV9kIinOYDSrC4TmnKmXG4mm+qWpKbESv7rMEtjVC
         vn4Z+8FUs0sLPzS4r9rMLXeNo1QgCgEKyp2sxuZ/yEtqrX0/oeiVMynD0iwvePE4pIKg
         QnANb3ChOS1Tq0jwlC4PEHX4/6+ZG9/zorhUxD/g0v7PLi9Ji/3u+2UWVJCnILJGuJ5q
         TvYMpwZc/rmz3hZUTiAdL7sD4qXSZHDE6tM5f02mwVlZLt04PvJz/8dzShgcfHcOuS6K
         VI8g==
X-Forwarded-Encrypted: i=1; AJvYcCVT51Zbm9zXWga2NeVIo+tzxsYF5j6k3hSHCYQZBiFJCmiZcd3jfAvAoVKHvTV6dp8cYUNiCH+ISelrkWeGogdZFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC7/rzhGZEjxXNdzVsstngx0SovrepLBk8LpJVC+ei3qY6kTvA
	qin6vdiWFLnshOx7QDxHTi5DKhoQ5hVvuf4xEGo6akAl9L4PrILXKA7aR522wEqPxQ52NzvXodp
	kWOWocVi/SVxGLPBiAXgx7GHdiO/TbeVjauZM0YGN0UdxoLqkLp8oGcFNa1ikqMda33M9QqcxeA
	==
X-Gm-Gg: AZuq6aKA87BG9hjp8v4YQiLbUh4lJ0vnIAZ0QDLnUoo6prB3rayT8WyfUcIrSGaxWTu
	VnhB3Dy7MYLO3UVPYRKiYPoDDkU5FrM/K0JZcOLET3dHojLnl7E1mKN20Wb+k2Ff++EjPeK1mhu
	VpNKJvvn2tn9slkxGciQOpwLDs38/0FDrU6JqYwKO95pfZ3gbSA4dMdEyZmQ+XnUvhw56wKNiJg
	U9PjgtI1g5OdW2oSku82zXnXy9rgCgIVP2eTEMjZ1BAOIGwohFD5Nw9ufjg7zvqqXfQWnNKYzcc
	TcEYInMJc/t/ODZXrsBLUxg/ukEgSCRmup9MxcSD8tTUMzn9/tU7mg7y1D6q7NZWT804qVWsVvg
	8R3CuaLJzeKqXI7aTSKFdNtaJ8AaSmF9QxG10BjxGwkaHJ5DRwops
X-Received: by 2002:a05:620a:d8d:b0:8c9:ea1c:f218 with SMTP id af79cd13be357-8cb8c9e009cmr764191585a.15.1771837594972;
        Mon, 23 Feb 2026 01:06:34 -0800 (PST)
X-Received: by 2002:a05:620a:d8d:b0:8c9:ea1c:f218 with SMTP id af79cd13be357-8cb8c9e009cmr764186885a.15.1771837594436;
        Mon, 23 Feb 2026 01:06:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:58 +0100
Subject: [PATCH v2 12/12] i2c: bcm2835: set device parent and of_node
 through the adapter struct
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-12-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u9n9l0NVttKMXo8Cm/QnZobv6JruCHoppeN1fvpKWko=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh6jRDDYe/3k1buXIvSNZ0TnkcrKdAhpsYOn
 u3Iy5X2HQaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYegAKCRAFnS7L/zaE
 w/fxEACOqkkkfaqNDgIlMNMHdbLfBNUN+gmyyErH+9RBYgw21lotLXldvXjukuDR43t7iBhEwQ6
 v4RmssSTTIPx1IaBN8RKqSTKhl9DxJTZoQG/RWkex+IXlSU6aNk/eapEsQIS/ImmReGyQbGzaUC
 7BGuDxYIhXrvzKsSOw1FzEhWWbMSZ4mtTdk1CZeUrsOGpc4smvhI1+XwAzfjXYf65/NK5LMjc8l
 exdlUnuKLFmfZboiBNCo872Eq0XM7NQmb7eOa67A2jpyxL3X9WXj2R5d1/Fr5IMGeWkZdnRpjSj
 5NU+AHl99u6k9MDIpqfSEV1EeSM0vmqqL/8Ixa1LJa7BDu2RNTN42T2+jCzGg42h4AIkgCTP/dl
 l8qVhh3hgMSHhLhJM9H9kPZwlvkqzO1eLwurRNKpTgz5jOjqwmhiOYxEKoxyr8+0J5LD6n5NLYg
 ZSNAJM/fPknh9iPDrWlWBHqxOKOSrZnLL6HXgCJ42zZht03ftuKgxXbEtQOCU2LIHKaePurzFUH
 3cKffAKB4Yo8oDatXqW/WoQ00bR9iDb5ms+rU2bXP8WjcYq5y2u8vrw+bMM8L/ZuzYmrOzIgmO0
 +mvyxeWTLzka7zKtqqCtpQUs7kT8hJHPP/MEXSqM3WPFQz0WeLm45y/8qDGNiDy+7ahzeaOkzbr
 cwHccInIQJYdhYA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfXz015jbDRKo1V
 yyZ7rb5nxZKeEHxGGJNxalzpIn1ys94c53QET4a+dOh3MI66kEHxy07knGpyWtHhOgy81W2m9iW
 di2umhiBzTudb0730tv/xgUEapz62DzlPhXRqnbQ4gCHmELjtVwOGnB9RBO3NfRpBrrg5qYZyzR
 xPs/fg03CRlUbZZ3AO5Tx4GXWcD1fnblUaB00aNBLb1dLygs494FeBAZCfAKRhp9Irn/HrBArUq
 OtgP7obZhbaCVnk/AkcjjzdL1uztOvBl0nExDqoJMG9rHu/ED890H17zDrUZzSx4ok13O/H4G8W
 tLPxr6tHJOS7RRwbC3miR6pciW0gtV5qJ4s9e75cDKEy5VQzKh5muQ0/mDaR/SnGykwbbvpWHK/
 ZmbtTrYU3VCBmpfNucI/kZt0pE/hb99IRiiyjFTAhkQi5fAHBvf6fLwSCY2SA860EjXKlSInsP4
 TPN//v8TFuxGrlkyefA==
X-Proofpoint-GUID: UOpbrDRMyHt1FEmIV-NQiupfE9G3o4X7
X-Authority-Analysis: v=2.4 cv=X71f6WTe c=1 sm=1 tr=0 ts=699c189b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=w6fcmXAubz_WdynIYoEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: UOpbrDRMyHt1FEmIV-NQiupfE9G3o4X7
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
	TAGGED_FROM(0.00)[bounces-28371-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: B2A10173B21
X-Rspamd-Action: no action

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-bcm2835.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 0d7e2654a534e92a529f27fdc049812359678522..4f7e4a178b33fdd172657cc625a34018b18f88ca 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -474,8 +474,8 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 	snprintf(adap->name, sizeof(adap->name), "bcm2835 (%s)",
 		 of_node_full_name(pdev->dev.of_node));
 	adap->algo = &bcm2835_i2c_algo;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 	adap->quirks = of_device_get_match_data(&pdev->dev);
 
 	/*

-- 
2.47.3


