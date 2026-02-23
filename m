Return-Path: <linux-renesas-soc+bounces-28370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPiDCksanGkZ/wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:13:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDB5173A1A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CD583101DBE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4273350A3B;
	Mon, 23 Feb 2026 09:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OF24CyJJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hx3xBQtC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EC13559DF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837598; cv=none; b=A2LZY6y1t/Sq5ur2J3uiUhFhAxAv/BD8NNN496jPiM7U4Z82P1zhDujaRdB544YLFXFEAf0DLZwU1/Ctjg+Nbw/c4/lizx0XT7BsN/QRVFbuy7aJO/Qyo/14n/4+gUEAjKvroGU7QPMVUWWXuuGT60OG1XCFhith93UFilEzQzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837598; c=relaxed/simple;
	bh=GNCZSO1tofFVimQlfEXcivvHDvpWa5BaBkjqLZZcroE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uvSg/HrirU8jU537IkFj3DsV7SZ6UmNEOfl6Y/jgg7Kh/Cy5OJFR/7tg9xoGkkEqcVldcaRwxXxb6aeFzgqOdnSQD5mjIYp4NQkiAPs7zW2qhstA86DN0JDCspYxhBJaNZpyKfLgSyhb0bjLNOPJ/qM6Uu9y0xquM2Y5OMK4iXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OF24CyJJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hx3xBQtC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMM9Bj2209592
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z1s69ZOUW4W/eG75pyy2jJwkNoebNytXCN87O0Rdgw8=; b=OF24CyJJeT8R58iH
	w8BMKHU7AVuj7IBfWA7+aF1MLDSW1w93K637as1xCBWheutodXGU2WvKF5f3Uf+Q
	J0X2Wtdj/ne6oU5oWhseU6ympGKihcmkjbUPlPBZniAIxSX5qHINcnoIAu5gqDcR
	+VFtM+iWAHeQzI8KjnMsLQUDkHIAqbiEtERrX+NbkHlFg/d53LLloCT7zMfjsmAZ
	DAxnspg460MiCk0GUxIzjL1XptcPRal+l3M7Xb8cHOIHu8bdSM+L1rTwDg8ynmxg
	R23GCEjSa69xofpCD4b7SlwlG9t03+EKAGSbzeUpCyV+cizLsBH5M1sOqhF3Q5qf
	heqZsw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3v1vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4817f3c8so3650850785a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837593; x=1772442393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1s69ZOUW4W/eG75pyy2jJwkNoebNytXCN87O0Rdgw8=;
        b=hx3xBQtCEngVyzOj8u8NnFEeYcKcZuEF8FwF0Uk6+b0nOAI0f8d15O02aUrDYf+S7f
         zoScNRjkhgJDfi2H7uqEeZUHcQilJi3CmYZh6Hc5cFLwEG2NbARheY1mLJA4G9tYDPBH
         3YYGnTsswJFIRqomM/OkLty7SDpVjAl4UHhjiND+KPZGMfNhPZNU+g2ll4ZRVlQW9XuB
         Q/AzJ489wKh8jRCcdcqliq4O5zUF9jFFQlF1PmTWKAzGzBmR6FlpNrGkzY9Aq9pr7tuh
         qvW011i2t8saIFChLs1OxBmiEqE7btdUcZ/SYcXNDmjHiAImOPtHYEeFy7AcjBFUM529
         Rw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837593; x=1772442393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z1s69ZOUW4W/eG75pyy2jJwkNoebNytXCN87O0Rdgw8=;
        b=TyMvYUsR0UHCyEh6Y4NjafQ4Hcm2NkidJx6niroLteS/9hv3r/GEQB4JkMXPw6xcnk
         PksqSRkrxU9+/a+SDTEdvY1QBjNK13J/GgWFjg84dF2dJTBxonAq/azI5ceXKlA5+h7A
         RhvUzfk4l6JwkwN+fwUc4/CKvpMq1rewycyNfk9v1SjNtVqRx4Di65niNEOZgWzmaktN
         Z4RQVLSZa+RkWzsBfU0pSjUPB63/ra83TbbCqV0leaUCuvxDvxtz7DzHlTWJGDg2bNt5
         Yl04FXU/qmSC1TmKgoSIsdy8/opVJYgKddD9iIWbDsLy5DIKsVa264fJZcb0QooEE1Kq
         3fdA==
X-Forwarded-Encrypted: i=1; AJvYcCW8lu97ih+vnoytmOcJFa4kmZW9T1kpScL0Jj/+bA6O2eP4dW/SFDacF0wCIQ0XSCc2V1tazaGVz+yUF3krgF2aTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxrRqu5jRY6/4zmnBW+Gue+9EjeKyg8l8dB1uJ3C0nBWqb5eE/
	GUPZyKWtfkS41TbyYeTBWMfbmGg6PntRbjfa+hcTwVhPeAtleHRPp2PUcN8aDhp9u6JBaEcZ0hp
	Ts+cs5lv8oIIRAVjclmPp3abJ66F2XsNZUZkgR1F0A0yp19qukeJITz3s3dRJHiQUzfc4KakguA
	==
X-Gm-Gg: AZuq6aK34Dl14GLfwKalImZ1upGrys1mqe21Kw5+Y4Mw1IGOFrXYSM3cWHkO6a910HK
	HNuqcA4JAnNPuHlH67Xjiuy/8C77eJE38RimQwa9S24I+u5YuBTLHF6JNlsZF/FV2zSM1GfMC3m
	Fr+SYTtA1dvZfIRaVAfY0h/rZix5rDIA1CgOmm53U/7PdIF4AQU//4z+25blUMzTK48jN7vQpgl
	i6fd3Tu/dCAvArIlOyiCmiyNRj4fWU9HGzz4Jg+3A+RlWbPOFXUpnzB4hB5SYyNsYUNxAgLUWNR
	fmXPsVBembFUzud3bjNTzpXo57I4sz8HxviZpbV0C4a29OM8en3B7NUjKC9z717V0+x1cP/oPdv
	+6r+UR2XFbx4w54UemvMp7vLnGefVsauxZfEtGc7YLJKm5GO5GgeA
X-Received: by 2002:a05:620a:468c:b0:8cb:55d3:2a4 with SMTP id af79cd13be357-8cb8ca08308mr922172185a.35.1771837593248;
        Mon, 23 Feb 2026 01:06:33 -0800 (PST)
X-Received: by 2002:a05:620a:468c:b0:8cb:55d3:2a4 with SMTP id af79cd13be357-8cb8ca08308mr922166085a.35.1771837592722;
        Mon, 23 Feb 2026 01:06:32 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:57 +0100
Subject: [PATCH v2 11/12] i2c: nomadik: set device parent and of_node
 through the adapter struct
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-11-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GNCZSO1tofFVimQlfEXcivvHDvpWa5BaBkjqLZZcroE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh66xd7+MQZXKYUp1lof2Wde5NsKOrQrt95U
 eR8Ce2ipBuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYegAKCRAFnS7L/zaE
 w04VEACsdT4VCfUT8Out0yUzqZzfml7dMxtbxcoCnGY8tQLapaBzscsfnI+5Bu5NVsBjRWz2YfK
 GKz1PyQVjNRu6C8ehswM/RGsSkjYRUxZSTdjV631sUHy16gbpFobawG+M6magVodquPAsrG2efp
 fw078QxbHLsGtHgQUf3QlBUOhMk22ArZLQ7UVI4eWPuitiP6f64SssRo7tqJ//BaGhTLtlxLgt1
 jvZJM6D+hpoylJBTdwdFh3LNOWlNngiDMmXlJ+TYP7vEyQAHqGifdZcZ2gOjEZvuuGtO/lEw4zo
 SozwKRkeYXSwgcaSyFO1dD01Yswbq2jYdHSqqQ/U6ptyeOxHXTthssXS7L2LPdlo+WWnkUba/Bf
 4oG7Kg6fqOGDNbJAGQFzXbP88fe9GJvo21ZhNEA96KsQPTOoYosm2cONZstWSuGzQHRYlbRNoD0
 o41lI5eyWu16TVPGP0JRYBMjXMYTYSlhuH3hkyYXocF/XU6tyGdnIhI9kAYh5ZTFmS7uDBVKtYs
 9Tyx0EIpX5yv7J38BgWtyTxoLDGrIrU5OAym2Uw4iiru7lO0Rf+h4+zA/T/ASHlw7uHwH0ZBqTF
 evk49M+ClOODknfwmlUK6g5DkzMRRmmnMtP8HudXzwpA2Gyo6WgvZHRgm23knlsypDaTyhOz3PZ
 EC6ZWixHAae92HQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699c1899 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tIHrhau139UvCPJ7cvIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Uyy_13aETgOIGAYPzTPgKjwlcJgslDQW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX8sDZ+17ARrq3
 R7Xc/GYAY4o9uUYmjEpQ5n2ToT7K2xVeTMh5IkWnWDl2W5wNB79AlHY6PrV2XMSy4Btt+9jX+EI
 fYom0k9/mj8P1eG4Ho6p8lYRGLagS4g8SVUWAKVigyQOB2QxkrGAHFtX3PfGumWcMr2siY3YvHW
 M+KM1Q/SzuUiV+Elgibvc4Z40go5ITAzhIFAk/ZJOm5BpEgCkiGpp/RKzVbKRf2I9ewHOoMO8gt
 u4BfEoJ4ht6CfIqPwgOMsPg0t6wCFHufqKMbxxcCOn4K0AL7tqmVJsgRiFSkT65HrkoQ3tyth7C
 oAtfKz1LBC057VO6ylidGo3++3MUw5PAJ4VpPeRwO3kZibP2Q5fQxH2LaT3aWnbjTEZMPzY6s7Q
 /EAjtzotfz4osZ9VmP+K/by74WR6nLQO8YFXvZWnEm+UcPTi6CXSytibVIXRwqdrW2d5W8fkDWu
 z2SxPvPnOirQyz4gn6A==
X-Proofpoint-GUID: Uyy_13aETgOIGAYPzTPgKjwlcJgslDQW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
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
	TAGGED_FROM(0.00)[bounces-28370-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: ABDB5173A1A
X-Rspamd-Action: no action

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Acked-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index b63ee51c1652080e414f4302bee16905914c1288..12b4f8750886d7f6f5b6027b00691240952a3694 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1148,8 +1148,8 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 	init_hw(priv);
 
 	adap = &priv->adap;
-	adap->dev.of_node = np;
-	adap->dev.parent = dev;
+	adap->of_node = np;
+	adap->parent = dev;
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->algo = &nmk_i2c_algo;

-- 
2.47.3


