Return-Path: <linux-renesas-soc+bounces-28362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +O4DAW0ZnGmq/gMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:10:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D47F1738DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D94C3037919
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE6634F27D;
	Mon, 23 Feb 2026 09:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahskkLVj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rqr6Mx56"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D4234EEE4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837570; cv=none; b=hzK971osx6QIO2reH7ExdHs71lSU1jLcOiDRY9kKeWHekTLLYHw+ORh3sCek1p/ucvLG0iIhZ93QjOOlSS+lqekvBAUH4d+wCNE/PoGIFpJcklym30MCkNa4sGsMlXy3W70Ycln4hoUZ8h/MQpXQ4ULj+w3VS2L4tguGQDt6KDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837570; c=relaxed/simple;
	bh=w5QiyKZ/sytBbiuy/pPV3fyHy9AlIC8Mm/XcZ8uxqD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FvGfZouSgv32pE7hVUZdxtJR9KjE0Ngn7kYCdR2ujLWp2K/mCfeDv3oCoCtY2tQwLGc02KqUB2QshKtPrZiT1rBVmMZcpfv79IoGskSTiBhFhr8EzAp9xULJGxgtDDZ/UNR29VznaRrPz4hak/2xnqGQBwQueuU15KM3pBVCsA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahskkLVj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rqr6Mx56; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MJvrMe1930507
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3PO5AtSucKAso++k1EL0+rR2+HTJk9Mvc5WVuDOn4oE=; b=ahskkLVjml4qs9Rs
	abCFDBueRJNKtfpxcsZThuGyOucLq3meLgxH0ube6aVttmNU36suWaOf44Bv2nQQ
	1pfOdalqzdw3RfKy++ZA/7fzftLPvTlNshwRP2387r+aukqiXBCG9y6hee3cY+nN
	Sk1V7J6kgBT9xOjGEIrrtzUqQHo/rGA9QeAUArWMdsojv2ZNB59Iy0HOMSf8qeDF
	Iskx/NWnpwlizui7cHAx9aLM9oogcOA6rth7ibovhjsGOQObyv6Z1msX7oSOjdiB
	U5tTLVDtTA3ostC7ZtJ5jyp75duyFqgqkPVr8iwxurCyrQEUqe59XxHCPXDqcrXG
	MgPrHQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3v1qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:06:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-894709fbae5so519229146d6.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837567; x=1772442367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3PO5AtSucKAso++k1EL0+rR2+HTJk9Mvc5WVuDOn4oE=;
        b=Rqr6Mx56LbiLjCYmRzojvIjzN68+ZjInxDHwMp6x3I88vn1YysEMx2RnX2BM+B6NyI
         P+yu8jgLWDqDxsS3uTlI/MWfOmkKXpqqz4DkJivI6/SIk/9O33HtWJXk8QLJOJwn+Rv3
         /k4jcFkefvTSv6tJaiMBUn5/llMMgOycf0rfEjt5hz76qLLP6kYfTj3DMLPC3x567Oru
         RN63UIOxMsGmJ9sdnB/56oRaJdrIs6K8evLTkFfkuFJyEi7XMY3ULOmwypA9x7GlI+M2
         trCbQEnQIyevzK8VzfGF9wkigZnza4+REXaWS1RqfhBmISDX571RFrzEwLqYgL+rO5K2
         2fjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837567; x=1772442367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3PO5AtSucKAso++k1EL0+rR2+HTJk9Mvc5WVuDOn4oE=;
        b=w957krMIbfOSgt/NIZP5c5NliDAYJ/80rtxnkBuBQx69PcmdA2C4sLuz93nZeVlrMg
         wQzlMnogzHfqH6YFN16y8460oidrL/yBWI32DveIMwIx08VneVjHxmt0WKfiVuKCJjA1
         bRulvvYgSC9sUOLRpiVyVtduzBtaraCjOiLRqjhsSsi/gr0r8byeLVKs27JOAuDYUdPM
         lQQ/f1CMB6qMzxWwLbL+JlIzAMCRrsqz1PV+FsO+pzwsIil71yDuFaiPk2+oDEkOQrzf
         hZ99b/iqk8FSRLlpOfiVv1e9DHSqtZ4HH+C6Db9nSTrxH3bnvmv/bmAvVBUvlRqNNIJS
         iS/w==
X-Forwarded-Encrypted: i=1; AJvYcCU5kpSXjoAG2tnMAUDg3rfsFo902Q7vIcGn7gWsVwX+UCLHY3SwNf8J4zgJtJXsJR9017M85aZHUwEW/j9mHOib2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCL6xBbuQ0plDgyn9iJjvcDyTd5t56K1jOzbSbQgvsYdoTiDmd
	ZVH++Qn2wOrVL3KECqkdEpccPe600IdIN4cxnTzrQNp+uovsdqIvp0Rpeq+ws2oRFaY0jWm8zJx
	+muh0gEAqaHkxqYX6CoAhdGwbZ8RIz563fiWzMGJYN1DbhyFI9+u8pZ9dIWdt2C2uKfoXmKjLuw
	==
X-Gm-Gg: AZuq6aIs+qqYWNxQsazaRshSkgxBsCYc1BdhtQkY4KIJ453gzkzrb0KmY1gUDyYNkl9
	ZwlNDG1VVjpvRAouL1cAj6KaPlgC9kmEuGksNnG4T0R/6QvEP2QHR+iRNVkXdzmSSLoPOsyeFNt
	Zm8WfORN79srZzeu7Vugd5ExOQNwNavLGTRTYHcWx1wK2hxARZOUYrXeP+au++gcjLTBtAlfD0p
	o/k7ueCDy0ZkLWxsK4saEL+qxOx2XEdbs8YOINKvihf7HC/Cr8YCwGR51dSWSxi1CWvpwKJ6w2s
	j2ARljiX6Xu5CRhx0/SeS3wTXPpV6m/mJjjOam5FwKG8+izDVW00kX3Sed9nkTjbiGNmvyMU8xH
	SkCdlAaFwFVtsvmk5C3PIxgYpbkga8atnG4Gl5O+FAtb+m3vbYemb
X-Received: by 2002:a05:620a:199b:b0:8c6:b14e:6569 with SMTP id af79cd13be357-8cb8ca94d09mr1041100585a.79.1771837567296;
        Mon, 23 Feb 2026 01:06:07 -0800 (PST)
X-Received: by 2002:a05:620a:199b:b0:8c6:b14e:6569 with SMTP id af79cd13be357-8cb8ca94d09mr1041095585a.79.1771837566841;
        Mon, 23 Feb 2026 01:06:06 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:47 +0100
Subject: [PATCH v2 01/12] i2c: allow setting the parent device and OF node
 through the adapter struct
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-1-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=w5QiyKZ/sytBbiuy/pPV3fyHy9AlIC8Mm/XcZ8uxqD4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBhwPaKoFJzyHUF6OMpnWGL6DX+ETQlRO5Y8c
 Ld6Qx2JUB6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYcAAKCRAFnS7L/zaE
 w/suD/4iFUyy0Dy49wTZDnpa2IU80l3NwdwALBtTFaokDwHgcweeaZLnFS+uMukTPoA6AdldIU6
 Xh4ZwjycC2TaenfGxYlTYVfa5ORU+p7HYVK0s6JQgqEhaXYdLLoxW2wC0VPADhBaNTKDgKjjyhu
 rmn5Has0Jd2hjrBY+aV96wRmo4/gieVqjUGAa1ClHeWOCy99MMh39cnk0y+MwKbQe24DIH0T/dq
 zQ3TSL8mqDXnKtnas9OqHTj0FEyC6uyiytZ+Zr4aezeellH2itHJzzI8Jy2y0BfRSkivHURH0xi
 VWmPtgxSeZs/nGjgUfAglbxQ7shfCBLe4jvM3sB+pwQIkucLvoYAmIsezdq4UrtRjy2Dq4iKvjz
 fCSlFthKTFiU/egqBN3hYrjM8ZxVkeT8PyTIf9ar4sQHLWHskPP2L+SGJjK6aEuVMorXFC3KMx/
 UxFIVf25usT/B/LO2Nj2evp9DYvPdMiOBLKKSP3O7zHjrYATLcdyDWew4Ps4033GbN7hK62/tgz
 3Q3aQrO1e/Vj2dQNHSETTjc0RefDW0cNSPbQbKoEpBbad4m1l6PsaVvZTw8px5OViT/l5ZKU6Ui
 J1+wlOaLdLrFzwfvmmWzxVt15PQWip1vRosoqASWqdOzpUvj2zAjxnzF7hszS1+6h31ZgPaMma8
 Iyx96xyVHty1QFw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699c187f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=GqsknrqNkdw30Ab-NAsA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: rsHJMVsdIGYGazBQbR8uujjAENVZ_yL2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX7EMGtCHvBjZT
 5hzBoBUw9O0wFWDo12LmEseR0R66afv1G2d+JNcZY9ZmTYjRHOk8vag2DKIfHLP/I+j7Qih69s4
 VJa63qpUA0vaggSQPN3Gruqk23XAXxcx6dDr84Z0flE7MA3tkJlVcgJ4cwM39o4tIqvxPPVo6Na
 sKH8pZJZ4kfX5bVPubz5/r2EhyRkmvMrIc5hitsahYOns85Za6xooeHFYWAQ6uf8xxBS1COBeST
 eLcVstbX+l+2JDEvtNwLQ47ZMwlfiSxMzD2BgJixcJxQpgUh6mkXHESs9FRlB+wXNGlFnftPNqL
 7lxzVOuIO1/KaXirG/vWJydxVam++1icBYNoKSZSrxTIFlE9jWZ6zwN6doyPz1SiY/EKME7Vuft
 yuc3qwZhnm5tD3V7clgMB8xp9e/jBw4FIS5mNOph726Jex/62Fy672VNiE1hCws2aY5NHjw+1GB
 LK4GZswf9T0UmXmSpFg==
X-Proofpoint-GUID: rsHJMVsdIGYGazBQbR8uujjAENVZ_yL2
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
	TAGGED_FROM(0.00)[bounces-28362-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 6D47F1738DB
X-Rspamd-Action: no action

In order to stop i2c bus drivers from dereferencing the struct device
embedded in struct i2c_adapter, let's allow configuring the parent
device and OF-node of the adapter directly through dedicated fields.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/i2c-core-base.c | 5 +++++
 include/linux/i2c.h         | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 9c46147e3506d15d53b9b7d6b592709de56e41b9..dd8cec9b04c64b8340d20e018ab5ba28f1f7f5c9 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1561,6 +1561,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	adap->dev.type = &i2c_adapter_type;
 	device_initialize(&adap->dev);
 
+	if (!adap->dev.parent)
+		adap->dev.parent = adap->parent;
+	if (!adap->dev.of_node)
+		adap->dev.of_node = adap->of_node;
+
 	/*
 	 * This adapter can be used as a parent immediately after device_add(),
 	 * setup runtime-pm (especially ignore-children) before hand.
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..72677f29aff161530bc3c497d1e07144a44eb9e4 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -761,6 +761,10 @@ struct i2c_adapter {
 	struct irq_domain *host_notify_domain;
 	struct regulator *bus_regulator;
 
+	/* Device configuration. */
+	struct device *parent;
+	struct device_node *of_node;
+
 	struct dentry *debugfs;
 
 	/* 7bit address space */

-- 
2.47.3


