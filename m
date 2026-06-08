Return-Path: <linux-renesas-soc+bounces-33661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 42mDKtCuJmqJbAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 14:00:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B239655ED1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 14:00:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Y83Lc6+c;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gJeIT1wD;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B01FB30575D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 11:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2CC37104C;
	Mon,  8 Jun 2026 11:55:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC30537207D
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jun 2026 11:55:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919717; cv=none; b=FPH5MLNB70fCWIK2TLeuuv3x3ezfSz3C+mrFY1tIxXCvLqr7oSNTbrSCANB7dEQVqZpLnG+QzIK5SRVhlfmNC+gPRI3CLHk2f7NnBmFdNhMULEehpAdNj9KyyNdKWnPk82nU5lmKzQbBlHjdQt1dTvLIZND5ZYE5LWzht30o42c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919717; c=relaxed/simple;
	bh=rk7AYJ4z8OZ4DXkV/TJkDYgs4eUjZwOGhMCC9Zde4cY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MXKMJlOseC3n/Uk/8MxnT6CvkZRu66kokSp+2Pw6ZMRYrVrHXZOI+ggXFKnzJuOYQD5Ak/jmTt5RoQIc+MFUpFUuNn3heQlfu017aO4KxyFUVG3vOrSQCUZ77RvRKIE45q/XtWIAlXNjGb/4xxnP291AeWyLxra3SJ0TrMZCHz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y83Lc6+c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJeIT1wD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9RQK2965344
	for <linux-renesas-soc@vger.kernel.org>; Mon, 8 Jun 2026 11:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GOTVGZ8oq/W45MZ2Tvy6YkoDC7hGXyw3T6c
	+YvvcoZY=; b=Y83Lc6+crTawKSpd2etjMcJNRajVj4+Yac7cWOogcgQen0oulHc
	LsD7wRpZzRUugCcYV0D8gJasLWEX66Md3XOqEICdSl8TtSjXzr72JFpTJ9KFMlSm
	3BshonKpTSHV7WluKI3w3svE8hccF5QOjvxGwp9kcKZ2m+wZGRwNt7iPvDTpYhci
	Tm7DPd8vykNEu3nN9kbJTAAYjv4ouL4HKCfnLcHLO8lXyQ8gsfamRN4OEa0zwQsd
	7ZZtS6XICy58vZpWhfhctlms9Jtoe94rJmPT1CdLmPYwYHvgilRRWvbu4Eg3sW4Z
	BrJAzSHpT0Z0EK/IrZ6UzJ8dAx1y76H3Ofw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkrqd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 11:55:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517615db531so117161871cf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 04:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780919713; x=1781524513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GOTVGZ8oq/W45MZ2Tvy6YkoDC7hGXyw3T6c+YvvcoZY=;
        b=gJeIT1wDk5xcTrlvA6uThEFLSY9ISsu2QaWc88Q3n98f6+d0JDj77P9eBV3FMMnqgB
         wmgnrn4+yx7XHdIX2/eJqO8i+9qlY2smncv4u6ORBuu+cVBC9R7C0ox5VetmV0N2KUCk
         pcri8/E1cDRrdf+jYTnCkvObkgwplI72zN5vHf9a+aGLDRqawy8qQk0BVbKcU8gbyhxb
         MO1iRnSdrD28qZhQFe6dyLhAkI5qYENaD56tX0RFKfwxv3qOMbV9O3JLh7mlB+MKiysb
         tqygJsPRM5xKQldrzMocbr+WYAA6dPqPDPl9BMuiMWYe9Uw1gDHMYVWPapQF9pj3/bQQ
         cFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780919713; x=1781524513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOTVGZ8oq/W45MZ2Tvy6YkoDC7hGXyw3T6c+YvvcoZY=;
        b=koZcTYhwDtk4BPGiLhuJp1SMQps6hgmxweN9amqPQO6e/yR8vOk/QWbRNAMueijrPp
         23yScxk9aFDcqm4PY8gNulv8LqZOwR6wuwJaYeeRVpUi8FYLitYd53sF3+AyG+QeyD0I
         lVT0BcAZvvsd9nKroSNQ0zqYMw8QBAmy3Nrr/zuT5Mk50f1RzM0uMzDeXme9xj4tk75r
         p0hOSkMi9mdB7quRWJZYNQ1Gnn+JmtSbNvIZ2P1kOOgeK9/PYKE11T2319qPq8Sqvrn1
         LZj5U7OZhnHDnlEizBHOBUxmx5C/GwBSz7XPj0BIeTNXfnMwWPPWYMrfiiUVhjbebC+3
         BHow==
X-Forwarded-Encrypted: i=1; AFNElJ8stpTUiGYmgAZ9l0G9kuY1DpZNeLyERSP0HfD1WbuKpn6U2VqpU74EQdJDvNiYneOIpisA8Z++ObitMkiMwD7Bfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ9G79mrXtqEfRaOtTC2SEu0jQSEplP1J4998bD9B1Tyz5Q/Ll
	blmGUgBkB/b7rNefCL7uNjrRgLtqDFDxoJvlcjFVPb9yXPdQ0lezXt4d6NEecP1l27LnIhfRMJW
	BHxDv4r6Yo11Sjom+wJhIYNHI0rdhHjeBDyVSo4h94EsGBObZGmj6CND/kUuVHdV2QyzDWLH7sA
	==
X-Gm-Gg: Acq92OECg9Cm98HLXllthVpsaf3No65Uxlsv9YtSkF6ZmT60lGdFq/nZkhGmk5wjSyS
	bbFsq/fKydKO1ujG1ZIDzfQiaZqI7bElR1Sl7Qi+Of4GpyP+1RVZMl0p60SdhD3Np9ePNd3jXHt
	Ekrj0tcnCvqAhBjXzoSeJUxaF2gDWI82vX7BhraKesybg4Xn+5XD8OlpPzuskaVLON02oJGxnVQ
	/eZ3ed5N1ucktVZQeFuPSNcM6RLBmHpyRDUTE1WH6p4ypa8e+AYjnBrD7HcJeOOOvH1i8NpaPlT
	fU67/QxWPn4CBCOwtDDoKhzlDw/8leNKSyZbP597DTsKtmZriSsAeN3bKDBsacJj6zCBQvwlgnC
	+5Nz4flIWDCh/gjuxRlPjICGM8sm5LSPPrtLTEo0Ln4mRu1Q=
X-Received: by 2002:a05:622a:1f18:b0:517:9095:c31b with SMTP id d75a77b69052e-51795c919c1mr221598601cf.42.1780919712990;
        Mon, 08 Jun 2026 04:55:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1f18:b0:517:9095:c31b with SMTP id d75a77b69052e-51795c919c1mr221598051cf.42.1780919712549;
        Mon, 08 Jun 2026 04:55:12 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc40716bsm410512245e9.12.2026.06.08.04.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 04:55:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mfd: syscon: Revert renesas,r9a08g046-lvds-cmn
Date: Mon,  8 Jun 2026 13:55:08 +0200
Message-ID: <20260608115507.134969-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=rk7AYJ4z8OZ4DXkV/TJkDYgs4eUjZwOGhMCC9Zde4cY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJq2b/orXa7P1gnWN7bZE7nNhm87KtXpyx54fv
 GLJTP2L4w+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaiatmwAKCRDBN2bmhouD
 13ulD/wN+43ZlXwt2ZPjhQV1uAUL5/RvDGGAJakA0JCqB0mo4dXqj+qoi5FD+HzBXLGmk5p0gXJ
 keLmeTeLFGdbzDXngQIGKUMLzGY8K+8wSBuERdwdJ0FKqZbeQRL/awmUrimaWwgm075n/yDAreq
 uQ37NnXmii085pKK2iMDbkGiedAO9zYqqaiGQeReF2deRUnYR1JgIMHhKEzSfQaWF/McHV+HLyy
 TKt8eTvEy7JsfEpKFN7fgPq2h/griOu8KArg/Wl7PhqVY1pB+8Sl501URc/HapAgv5uX/GnFmGd
 n9jJ+BHVfKNaTh715kP8CZWdeWbpOJDaThSfQcjWMXzWUIdcUnJsrVLm9vyToMZgHw7SrZxeStN
 /r3mTvLK75XV4QUGPTg67WLK42uKbcNYSPoI0WBuTBY/EKPegAoIQEdc3dzbbxVlV3HMLTThIWX
 +M7LQ/N3+snLE+WiiLVZh5aVO+Elzk3JASjcbl8prcC2tpLw6ccHskBVBKqh6aq1gy1eA6dq9Kc
 i1sFgnaYy4IGr2G24gc83+3+qgsheLSLlb7A7W83DK28wsxGslv2j0HO7p2dwfvTFl3ZUIvdaOA
 /h8feBBDxzjT28FxCw3I0WNRafhAbRiMD85jpoz0zuYoSDbii0qkm0zuvk4a3lLeFMc36hau4pl FSS7CDzXe6AwIhQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nY1hIS85V5EsQlykG4Gu_XAYaPxObkFh
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a26ada2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=y6noWO0KkWWok_DAT-gA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: nY1hIS85V5EsQlykG4Gu_XAYaPxObkFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDExMiBTYWx0ZWRfX0Iyom9/0Uz6c
 mi+DOXqS3zxZLjB0yeo+NEkKcfch8Im+FPzbJKEQawZQhSdRJ3GWHGJ7/5YR++3vPzwAcCKYyeV
 aI01KzPtKvd2nZu5duPLGAp2l3B8Kim4kRGxiJleV37giWN3YIujASZfrF7cs9pFB4HfqYV1EgV
 Do2/i95P27dQBtpREc6hfOpd98lAdO91GBDfx/8wKU8nsxz8q9Kj9D8gtfYnOrWkhRI8uAMZ49L
 GNpCFt2F0abU4JrmG22JSqi44uLXYsjby8WjLqwEpYVXwO0uBFz0jUYPL9IPuey84cWZ5UEDfK/
 sL+fWW24GQMLB17HvviGxLYt/jFRY0rtBKZE/h5uIH+30ZkWc5RVPF+ZsTuWtzhhbVVdQYErLaL
 +Cs2Dilo53jK9XI0kMEFfNFptQ0iGtkQ8ZFPVMt8251ZiCP4EVz+Bip9dAO6VK6gnhKyEAekVMH
 V307El4RqQK8zVDR3cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-33661-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:tommaso.merciai.xr@bp.renesas.com,m:biju.das.jz@bp.renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B239655ED1

Revert commit 51284d8b1dbc ("dt-bindings: mfd: syscon: Document the
LVDS_CMN syscon for the RZ/G3L") because it is completely not matching
reality and clearly incorrect in respect of renesas,r9a08g046-lvds-cmn.

It wasn't ever build-tested by author on their DTS, either.

The documented renesas,r9a08g046-lvds-cmn compatible clearly disallows
any children and simple-mfd fallback, however its only use in original
patchset is with simple-mfd and children, so this could have never
worked.

Fixes: 51284d8b1dbc ("dt-bindings: mfd: syscon: Document the LVDS_CMN syscon for the RZ/G3L")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 9c81010d5a74..e22867088063 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -221,7 +221,6 @@ properties:
               - nxp,s32g3-gpr
               - qcom,apq8064-mmss-sfpb
               - qcom,apq8064-sps-sic
-              - renesas,r9a08g046-lvds-cmn
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos
-- 
2.53.0


