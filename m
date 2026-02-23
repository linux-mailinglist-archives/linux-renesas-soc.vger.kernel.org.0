Return-Path: <linux-renesas-soc+bounces-28361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEDTAlsZnGmq/gMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:09:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 813461738BE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:09:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DF793059AAF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90F634E770;
	Mon, 23 Feb 2026 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hkdj2Sw3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WmWCq2Nm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9C2137923
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837568; cv=none; b=FOfwS2ETbBtgLRRvhVHaXmdzif0wFLYElwN+hVs10DZS8E+t10TPyw/5l9WL/zpSGkOeN8NzB5pNSUyMKo2FY27TAmhsvyFi45NMEa+Aws+5BOughh+I8rhXeuhrjBSEqBxdapmQpVUmabkZdNXnJagcP2p61qlNloyKt8Ebf2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837568; c=relaxed/simple;
	bh=JpXrrkvz1SqkKT+f47q/u1Jea7thg425ucswYTBTXns=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U1Mr//vCSB2sDd+ZUsnxPEKtV9EF7a35jHMMRZCGZDVeulH2kBhoms+xxTuGXN7xQR6rt1zMMy+ngWyvzfRkDb5mLUN3vFzBORM6SRl1NLSHESoBeeLqVjO66hYQFdKIse71U99T3Hw9FJwVs6rn9cqxNGkwMrLcqRYzp6YcYPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hkdj2Sw3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WmWCq2Nm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNQ6Bl2061057
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=d746oHHLRYVQIeqZlUVXE0
	SwM2/yPUbSyBrXtuCBM8A=; b=Hkdj2Sw3YW5wYjJXb0Yo5KSdJDYZ6mNkjKglmt
	HmIpjNRzyZcyIv30iqmZrVIu7F/Tx2xmWjo4hMquxsTBDozOXCx5yj9flUsE0lCf
	W1j/CZkwXF0jRQFWdXD9rYTvOPYSjslacPJZK4HS0//hMA+uu4EjDrg+a/KArh/2
	tONKtnjZs1D3baLsoo0wvSB38Xe/pXezA//8unJlDsTMUyDidspV0hDibBJhpEpP
	rGQe1G1YtSaVMjupePw3YFoYy0jMPCwS4lFQBunN2odLW+NGvhr4WPquzMR7bgkH
	1W+GKe9cisPIXIjZk1HysFVOD7JM/Q+yFi+wdAomaF3tDBBg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wav3b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-896fa0fcf27so572280776d6.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837566; x=1772442366; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d746oHHLRYVQIeqZlUVXE0SwM2/yPUbSyBrXtuCBM8A=;
        b=WmWCq2Nmbzzwt3ObF4e2Lh9szZlxYDz1x86UPgLort6YeFaK13K5LXXCwg3NKsNmmD
         2Ary7Za/F8YFizeX25hH89aU2matBzxzdfSJEc95BOHFWxnbyqXlx/k0qSDhh3ETUe6n
         JaCURK5ycsvy22jvOPS4t6iE9cGiMUrfybCVPscKcuI9/scP4qZRNrRau7wOEES0wIo9
         DDUucCBz7CUDJHeC4RYOcYe1w16AyS2Up1eOB83R63bHWHWkGMrihV6jF7PMm8kTkE9u
         dZbrALsSxLkGnR1jCVD9Mj8FSi1C8dZKCo5/SPK9Ozi7h7L1SFT7O5icRDyWzIEKnc13
         OGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837566; x=1772442366;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d746oHHLRYVQIeqZlUVXE0SwM2/yPUbSyBrXtuCBM8A=;
        b=C4B9oj/hDzfZDh1QfAiiepn8tKdwdgoEod4zNixo6zGe+4dH7iYcvBSLMCXnb2+ZtT
         QjdrnxtgnNlGia/MAtRfLLrr7hxHHnvquXz8g0t++fQGM6ntP5uWOJOUZZdZY+LH4TJv
         y+ET9nxkDio79lCbrTc9s8w67+NagKa1adDYI/Ida8Bc970+C4DkGmOjio7Kc2e2JXRY
         P0Wo1rsZ0XL9fEM3We0qhE2+fiTV6i+/TM8zQbe9FuRFw9mxpjH+nsFRwyO36OGaUEQG
         gDozEi/VBQqSuLqoklDkiU/YhqX5Mt56kq2QarNLqQ8QeZCXDeIxgSzChFA+7PR+ym29
         hOEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjVpyXe4K62XQUa8l6h7oMGdhq+pDfdvmf+4hw5WuWYcrmfNKS3EXp+L13fFn7vJ0iGZogdYYVKR2+LKyeif2RQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi9sIXAV3QPGrBSoD69spolBudXw+jPJQ2rFRKebGRICWKxCF6
	+g+T4h49NsZrErdpgexM0QHQK3G+HxP5Mq3SZOoAVhT7IOgRagKHyl+jFP+rl/a+CZqDze9ejRv
	rDKYMf5eI/5hlFUM4KZNw7lKwUSAraHX0VTFb1SfAsYGxu/1x5rjw9xJaodX8e8BKSR4ZmoT23A
	==
X-Gm-Gg: AZuq6aKXjuAy3+y56mPcQRe9pdOQ4rIRFPp0I2T7+sOr5KF1tyYRlKITifZZnBHOq0t
	XYwtXVrG+Tw9VqX/VlgQWEkQW+PK0wGbfwPJog8uRAqhIHEdjx48vZeiKeRQajiFqZxjqerUIqg
	AUTslNeGYczokt2j13nG1Pg7CLXIJG3gJ2jcXLVHklCjPEILYDKRu4DR2KdwUZ+v6jG6rGJoJod
	qg6K5UkHFdRRq6CRYvRafPSfelTMCfBVXMyARWSRNaU1C6AAm0RT9uZQnoIy0kt3QLiRwCtMjMr
	Np3NMAfr2d/7SE1BhJkfrgSSD8F4/9wpigDAAdlaa2AMoaFsMip+/2+i3/NpR/iK+VR284hXKe6
	DDY/ppmnk3iDli8vrHJFNzX67KwfiG1rBXcFsESPKkgRNsMJozBCv
X-Received: by 2002:a05:620a:440a:b0:8a2:ee8:e7cc with SMTP id af79cd13be357-8cb8c9cbf76mr933268085a.5.1771837565487;
        Mon, 23 Feb 2026 01:06:05 -0800 (PST)
X-Received: by 2002:a05:620a:440a:b0:8a2:ee8:e7cc with SMTP id af79cd13be357-8cb8c9cbf76mr933265285a.5.1771837565026;
        Mon, 23 Feb 2026 01:06:05 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:04 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 00/12] i2c: configure parent device and OF node through
 the adapter struct
Date: Mon, 23 Feb 2026 10:05:46 +0100
Message-Id: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGsYnGkC/32NQQ6CMBBFr0Jm7ZB2KBFceQ/DopQWJhGKrTYaw
 t2tHMDNT95P/vsbRBvYRrgUGwSbOLJfMtCpADPpZbTIQ2YgQbUkqpDJoB70ioNNaPzieMRWiUr
 3jZTntoa8XIN1/D6sty7zxPHpw+c4SfLX/vcliQJVQ20vjRNNpa4+xvLx0nfj57nMAd2+719Xe
 PRnvQAAAA==
X-Change-ID: 20251223-i2c-adap-dev-config-9403ab811795
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3636;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JpXrrkvz1SqkKT+f47q/u1Jea7thg425ucswYTBTXns=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBhvxfpNuGH+Q1zSVb894hMaRDnJVHASheoKh
 tGcI0PnAP+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYbwAKCRAFnS7L/zaE
 w2YkD/42gmVI2glVDEDj52itfZw7ufLt0c/DcLJ+FZ7kHYFIsxyL1dHKGe4ip0B7AgIg3kjvham
 4i3sHarrlQxHhiXD6lHA7AnTlJUIwbMYiR16u0EENBjpiwcPFOtcEFsQ9SCYk1dWNQt3z2vO/Wm
 RFF+dLTjTwIEiU5NJqAXHpTYFoXSdbIC/LKveT4OMA1CE+6F9Rooja6KT1Viqx5w9KYiqERenUs
 KKEakJIRPwEdXmYJTw2amUBwkeQpse9u7vd9Vl3RzRobgSLiVNBMVK5qVwSSNrxpkR3W/LcISns
 J6eQWlwN5lNv6ZNnvQ2/iMz/nG/VUHizCcwYan5P6cqRAaCdgLC0vnEvpU+BUUs+BlAD9aNcloG
 YQzNfV2pb30/guwSgRWzyLvYk4NXFUGPMIZb/qNxSx8humADFCW2flXVUruER7lFEg9WN0d3TWT
 qR2Im/+JgfarMzxldfnFXoDo6VLvHdDTkohcolEMMiWL5FelxokYgAi4ZTyecVtCK/BRXKyk6dB
 ZKOBjFyRLll8ol5KO+xRrbOkNdJUCaOZzAf40SQRdALQyfA6qRh61awI926JLvDSJsbM+ZQImI3
 fdEhPxSb1oKvTqdML31ygKLLfaLfNiiHdaQ2DrH2Zzvx3sbfEZUT6GzxcuQ7EdMo7Eo30MXyz4y
 xexRaCGsVEHWxXA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c187e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_sFN2lLQU9JdPEgOWvQA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX9AnySaApfPEO
 zMvLFCaTnhBH9pNQb0BdOYZRdLQP60it7epJfRQ8H1YMcs5JnHJ0MuTWCI1zPW67HtSboUHGxFB
 +r6bY+l8J7BTZY56grh52+3Kl5ZEhiCI5wyHIbPmmhf6Oz4MrMp5iyNV6kaL1NHrsXmxmV46n7I
 S4JiIlrerxEENxcWbE7wnFULl89keylG0QeOK9GJafmwUHSNInaO3GjSHXKV9yBwx2V2Xex4CGD
 m0hsOggs8PVFyfdFH4WZvSQOSou0dk4SL+zcP7kgeF11znToDHymsf5t5wWmZcoGlC9aYbzeOXV
 ZIBTTgCmTtMuA8oCfL+ybMQ46szAtK55/YIzbJ4+h/RdKdYFEKs4fTgXKCu7XtvsGNepaxRqmW6
 8r1DthVNmOdb2/k92ARRMsar2La0GmcCihuX3HjSoM1+2qw2WGQft1n9bnBrGghXR7++el2aSpL
 FKLmbq8DrMIBO1Hg+Vg==
X-Proofpoint-ORIG-GUID: G9P5RYe4diFyDq8ejXvd12GxSgFiloj_
X-Proofpoint-GUID: G9P5RYe4diFyDq8ejXvd12GxSgFiloj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230081
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
	TAGGED_FROM(0.00)[bounces-28361-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 813461738BE
X-Rspamd-Action: no action

It's been another year of discussing the object life-time problems at
conferences. I2C is one of the offenders and its problems are more
complex than those of some other subsystems. It seems the revocable[1]
API may make its way into the kernel this year but even with it in
place, I2C won't be able to use it as there's currently nothing to
*revoke*. The struct device is embedded within the i2c_adapter struct
whose lifetime is tied to the provider device being bound to its driver.

Fixing this won't be fast and easy but nothing's going to happen if we
don't start chipping away at it. The ultimate goal in order to be able
to use an SRCU-based solution (revocable or otherwise) is to convert the
embedded struct device in struct i2c_adapter into an __rcu pointer that
can be *revoked*. To that end we need to hide all dereferences of
adap->dev in drivers.

This series addresses the usage of adap->dev in probe() callbacks where
drivers assign the parent device address and the associated OF-node
directly to the struct device embedded in i2c_adapter. We extend the
latter struct to accept the parent struct device and of_node directly
and make it assign it to its internal struct device inside
i2c_register_adapter(). For now just 12 patches but I'll keep on doing it
if these get accepted. Once these get upstream for v6.20/7.0, we'll be
able to also start converting i2c drivers outside of drivers/i2c/.

Link: https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- fix a NULL-pointer dereference in gpio-rcar (Geert)
- rebase on top of v7.0-rc1
- collect tags
- Link to v1: https://lore.kernel.org/r/20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com

---
Bartosz Golaszewski (12):
      i2c: allow setting the parent device and OF node through the adapter struct
      i2c: qcom-geni: set device parent and of_node through the adapter struct
      i2c: bcm-kona: set device parent and of_node through the adapter struct
      i2c: keba: set device parent and of_node through the adapter struct
      i2c: omap: set device parent and of_node through the adapter struct
      i2c: rcar: set device parent and of_node through the adapter struct
      i2c: st: set device parent and of_node through the adapter struct
      i2c: mxs: set device parent and of_node through the adapter struct
      i2c: highlander: set device parent and of_node through the adapter struct
      i2c: gpio: set device parent and of_node through the adapter struct
      i2c: nomadik: set device parent and of_node through the adapter struct
      i2c: bcm2835: set device parent and of_node through the adapter struct

 drivers/i2c/busses/i2c-bcm-kona.c   | 4 ++--
 drivers/i2c/busses/i2c-bcm2835.c    | 4 ++--
 drivers/i2c/busses/i2c-gpio.c       | 2 +-
 drivers/i2c/busses/i2c-highlander.c | 2 +-
 drivers/i2c/busses/i2c-keba.c       | 2 +-
 drivers/i2c/busses/i2c-mxs.c        | 4 ++--
 drivers/i2c/busses/i2c-nomadik.c    | 4 ++--
 drivers/i2c/busses/i2c-omap.c       | 4 ++--
 drivers/i2c/busses/i2c-qcom-geni.c  | 4 ++--
 drivers/i2c/busses/i2c-rcar.c       | 6 +++---
 drivers/i2c/busses/i2c-st.c         | 4 ++--
 drivers/i2c/i2c-core-base.c         | 5 +++++
 include/linux/i2c.h                 | 4 ++++
 13 files changed, 29 insertions(+), 20 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251223-i2c-adap-dev-config-9403ab811795

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


