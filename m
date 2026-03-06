Return-Path: <linux-renesas-soc+bounces-28938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHbIFS/DqmlXWQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 13:06:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D79DD2201A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 13:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 745E4301AA5B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 12:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D93389112;
	Fri,  6 Mar 2026 12:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ftqcklqz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ciLIc0y+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413EA34EEFD
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 12:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772798589; cv=none; b=XBwQCGLKgVqAKBe0IvFgsuMvOT5jygQEweWrqKs4e0Toh26vSeyV7pA9q/VdPA0+TUIQL0b6B5p9s6KzlnBJyrXXV1LwgWvQQL0RISS3RaKYyGb5POo4ObJePYPJbvOzwJwZJPX60Csc9OqLEkb1axeW1Ugny+pypIPD5P+ajCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772798589; c=relaxed/simple;
	bh=v5d+8TMs//diZzfnEWgGyhhdAKGNkQFzaTDjGWP7gr8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ttLc7rwKDlPsuHcXrE/tb+cOfoPYQ0TjvwzgRFH71/R/JurmhoOZw/xcm1QsT8VESqfCrfKwsOf+h6hJpfUcQwWezZFjCXwk5l7/4sy9ZcvmDLWJ7TQ1EnxPvxaWZhW+q0o+aFQGwGyRZnq9+5dVxS4OrGpgSbj8soiDF64uW04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ftqcklqz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ciLIc0y+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Bag0j4185912
	for <linux-renesas-soc@vger.kernel.org>; Fri, 6 Mar 2026 12:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1GiqlgsFE8CGKryXMNnXKy
	5aJvVVfqLeFztsWGF06E8=; b=FtqcklqzdG+X+PcXkmHygFC9TzkZHhQ9Pt19Su
	gXav84dk5ETapmSlrL96cZWEZ9rBX+8ZX8GmdlS9636TOjhJdK2Byf42pPpAMHAv
	+h+sIfvkIaiBjvlbs2ECOPLwoq6Fhny4/oDSQOhY1qY+8vCt35VJ9EsXddCrAAOY
	HQ97MXlYEVCGT/VXP0bqINkp3OHc9Tdb5iN/3A/fxJZWkVvi42wbztascXKxoS3u
	MrkjlbtnedNnR7M1RxSCxqzHdlMRycU+KH201TjJ3nXptK3a0LcEZNobZdEMNkLY
	odyLP3hcfVKSOvFiZs7hPBrGddVXwCBriNVm+yHDMVOdE8ng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruk98g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 12:03:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cff1da5so4834396085a.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 04:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772798586; x=1773403386; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1GiqlgsFE8CGKryXMNnXKy5aJvVVfqLeFztsWGF06E8=;
        b=ciLIc0y+e+lQpH4Djtm+38lg4ew389t9QMU3QRbCF238i3p/mErPIJ0ktPMvDE66eB
         gOrrJdgDZhIhIjKjOOCEKpDyl0BtHaBgsSIfm9r7tVtWPyJaR0gOTNG1iIRs29qC9h5i
         HF1mUM7c1ke3Bf6BMbzCywesfpNlIQTF8nSV8NpKkUEcY+xtBta1k6W94O+nP9D+2Is9
         OH82gYth53xOalqi4nWCIxAYhedEWbsN+LNQDsO/C2QWhgr5hXQOQuAXKFJ/C8bwTeAa
         H6+VldqQUB1UGqkJmO7xmvPuCd3xz/7bfU+zo/0C+VfwpwNj3zsRB3xswv6hp8zpw8EF
         n5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772798586; x=1773403386;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GiqlgsFE8CGKryXMNnXKy5aJvVVfqLeFztsWGF06E8=;
        b=ZDgnpW2H8wu4pFUGGcrHy/LiwDGmTenD5zhutcV986bzCOvWU13XT0/mcXRblQed+w
         h4vaUI+GaUzRy7yNVjbolMCfxpsA4JLCXR3VEYexZwsb1+JzduzVdY5EVefE4PHfysw8
         QPksRInxySXqHlUoym+ynAa+DQ6dVJit6DXkO9mR7uFwS05bQQ/NRGxY3lWNu33hiq/u
         n/M3rZRKiH5fVOpATYkXGJ9OQ3vf+5T8qPRkyf2jn8nsuXvF6kpz4Ow/oS3MolvfWi4B
         Ku8LcKCUXAfmtTGqoQ33iWlKtzk4/SdjEM0xU2bMdrdxZRyPNCprgXHJiDtzHgHRIcpj
         /gMA==
X-Forwarded-Encrypted: i=1; AJvYcCWTN5+2BPEH87tmBYEwqayo/jHblBKvpGC9p4naVLLgyyYDcu1INqIL7Eq1pCUUSBpbtxUVO25q5tbvW3Fly+n1Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVoRXs4bBMFN1uS9s92VyO4/Js3p8c3sWTnJ0JcYDh327GbgMR
	NVfkhHr/W4+x+Pj0UWJMuZu773OFPUo6GgU4A7RSOf8hTM9WOR2ZTbhEa/AX623OrTO7p3n2ndu
	fTov+Cxpunygmv/JSCMAmJdU5uJTSVIJSJpA180LOkVBSSyoo90227eLwlWkdsnmpR25HtRLwiQ
	==
X-Gm-Gg: ATEYQzySyFxmS6dobiv/uwngblMT6Tw0vHk7ff1bLOES+aWcGLDqgp169nnvcFAULd1
	Fe27NPUdEQbromh11qFqDj78EgbZf/DEqotVF/PDvvBateFpfnCPRPM6rvUPIn/IHJ3UYXgw6FH
	y3zo75+9dDAu7yiaBeVUmto7zhhpiA9P4BIr+1SEPDlCsVBGt/tS2wFnNfBuvt2GRUSnpdnhXqU
	S9xu7KKya6Zpdk6cjP5PhxAm5z114Vl8RMzLoO85TalHTuiIjEqq3N30xSjL0Q/kKKXD/5moudJ
	dW+u1indMKLGborPPzP+hzH70pvIje1DkHLN/MB4KHNJGC2wyoHEUEaJQcDoffQ+Gw/a6KAVsUc
	X9Q3UWT7sVqsFamAZg+lLbQeI2AtN1TkTe3+fdkru5C1P
X-Received: by 2002:a05:620a:4149:b0:8cb:4c29:66b3 with SMTP id af79cd13be357-8cd6d325855mr217727185a.15.1772798586128;
        Fri, 06 Mar 2026 04:03:06 -0800 (PST)
X-Received: by 2002:a05:620a:4149:b0:8cb:4c29:66b3 with SMTP id af79cd13be357-8cd6d325855mr217720985a.15.1772798585549;
        Fri, 06 Mar 2026 04:03:05 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad1cb7csm3410129f8f.0.2026.03.06.04.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:03:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] dt-bindings: display: panel: Few cleanups and fixes
Date: Fri, 06 Mar 2026 13:02:53 +0100
Message-Id: <20260306-dt-bindings-display-panel-clean-v1-0-3086eda1efaf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG3CqmkC/x3NQQrCMBBG4auUWTsQU6jFq4iL2PlbB8IYMiKV0
 rs3dPlt3tvIURVO926jip+6fqzheuloeidbwCrNFEMcQh8Gli+/1ERtcRb1ktOfSzJknjKScS8
 iI8J4wxypVUrFrOt5eDz3/QCX1fu2cQAAAA==
X-Change-ID: 20260306-dt-bindings-display-panel-clean-3ddd8e087ef2
To: Artur Weber <aweber.kernel@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3891;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=v5d+8TMs//diZzfnEWgGyhhdAKGNkQFzaTDjGWP7gr8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqsJv0GKN3ISA0GmNPQMccFSNZcG6op212Zbfd
 lm4FxQ0e8mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaarCbwAKCRDBN2bmhouD
 1yM1EACBGR0+PA3/8X66dX5Lot1jR1nfgaoCSnR55X1oNKVXwq5vZkG8YoU6aO2WvrmEFkzV8pH
 nwLARLOlgkI2NhIHGZGnPBoJ1HBpqslQmcyo7rJE6vsclCWvqSY/2CiSePn17IQMnFP/r+OqHR9
 KCHziZoNTJd3+aq4kdYGdEyHav/455lm+eNXDOrPnKZI93w0U2mK5haSSKsJ4GgAiTqLIVLkiaL
 SOmBLdVVqe2NYbDH5KBH8yYq7xbQq2zRDmaddzvX0vY1K93ZqsI5SA+VWwqS1agSn1Tm/WvAgDQ
 lMDuERCmK9Dn2v4G+sFLWb6S1kwKRH5vRgoR3M2MMqp6WAxYRaixzYh6qoHluu4f5XC0s2U6mYY
 oBCY/cbXQFGotePWMY5Iv/cUVUBtH50jZuZnM8QjlkHbaR05UdwV2pbbmooX6wgG3GWYakTVqu9
 LCS+8DBVbnb83DXQNdFJpt50X0qKRUYQKL5oTFP5xCl9oNaZghn7Qd5oe2ea0dFNUPKNmFQAQmI
 iRFdvV8fuhakRXB8c0IK/h1DF3mf1E3mbGcpXMN41M3LN6oRUz+vtdOwtjJrreS4keIJ52xdAdK
 Jvq8jHm6TuJcsVGYkhpUkprRgj1cPBYhs5+unDYLHJ+iBhbVCZgT0DgBChb2QenGh4c9BvU0cbq
 EjTpUkaHkaodGrw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNSBTYWx0ZWRfX9xa+HyLsWQD0
 tKgBU5kXpka2xvHlBWtguM1OhmSn4ZtlvaZjnMY6ru3/1eOpDDGgsbBu7qUwHfTgpa5Hy5KAujQ
 VFvq5urPHfo+8AP+rA1GfVi+v9w5YD/7Fx+ZUqaAnSMaIaSgfBoYRK+T0x5Q5JvwxkAJxISsusK
 /8QN5lftpEMKutrOLYV0LHJ7y1kF643C1xiIjzulYa+LgBftG0q0XXRoRvkTp5jw9xo2ppehtp8
 jROHQoU7gJX2NtteK8LGLumdyc8dcRc/X4IUfKN8Cy1/Zxf2RJw4QFfxORSp3ioaFtrsLXIFE5c
 zu4PWx9pfWQxRgRQ884G3pm04jZ02bqi9/8dALAR+8tdE/xlkWE4NL6NtgAwt1as8roXGxzGC2l
 kSFz2pWcMtsajKrlkfmTVo8UdnMB/6V2U6pLTArH+9T8vanKM3pYvKfts/8vYpo6TpuRXeO6FEs
 6SusvZX10Ta3NDLnv9Q==
X-Proofpoint-ORIG-GUID: 4S5-5rXbPaU6Fp0H0luE4u_7maKw8HQZ
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69aac27a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qVg1fvbrlvnUHraqLWwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 4S5-5rXbPaU6Fp0H0luE4u_7maKw8HQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060115
X-Rspamd-Queue-Id: D79DD2201A1
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
	TAGGED_FROM(0.00)[bounces-28938-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,ti.com,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

I would expect this going via display, but that does not happen often,
so Rob's tree?

BR,
Krzysztof

---
Krzysztof Kozlowski (5):
      dt-bindings: display: samsung,s6d7aa0: Document port
      dt-bindings: display: innolux,p097pfg: Document ports
      dt-bindings: display: panel: Drop redundant properties
      dt-bindings: display: panel: Align style of additionalProperties
      dt-bindings: display: panel: Align style of "true" properties

 .../bindings/display/panel/abt,y030xx067a.yaml     |  5 -----
 .../display/panel/advantech,idk-1110wr.yaml        |  4 ++--
 .../display/panel/advantech,idk-2121wr.yaml        |  4 ++--
 .../display/panel/bananapi,s070wv20-ct16.yaml      |  4 ++--
 .../bindings/display/panel/dlc,dlc0700yzg-1.yaml   |  4 ++--
 .../display/panel/feiyang,fy07024di26a30d.yaml     |  1 -
 .../bindings/display/panel/himax,hx83112a.yaml     |  2 --
 .../bindings/display/panel/himax,hx8394.yaml       |  7 ++----
 .../bindings/display/panel/ilitek,ili9163.yaml     |  4 ----
 .../bindings/display/panel/ilitek,ili9322.yaml     |  3 ---
 .../bindings/display/panel/ilitek,ili9341.yaml     |  6 ++---
 .../bindings/display/panel/innolux,ej030na.yaml    |  5 -----
 .../bindings/display/panel/innolux,p097pfg.yaml    | 26 +++++++++++++++++++++-
 .../bindings/display/panel/jadard,jd9365da-h3.yaml |  2 --
 .../display/panel/kingdisplay,kd035g6-54nt.yaml    |  5 -----
 .../display/panel/leadtek,ltk050h3146w.yaml        |  1 +
 .../display/panel/leadtek,ltk500hd1829.yaml        |  1 +
 .../bindings/display/panel/lgphilips,lb035q02.yaml |  4 ----
 .../display/panel/mantix,mlaf057we51-x.yaml        |  5 ++---
 .../display/panel/mitsubishi,aa104xd12.yaml        |  4 ++--
 .../display/panel/mitsubishi,aa121td01.yaml        |  4 ++--
 .../bindings/display/panel/nec,nl8048hl11.yaml     |  4 ----
 .../bindings/display/panel/novatek,nt35510.yaml    |  3 ++-
 .../bindings/display/panel/novatek,nt36523.yaml    |  3 ---
 .../bindings/display/panel/novatek,nt36672a.yaml   |  3 ---
 .../bindings/display/panel/orisetech,otm8009a.yaml |  4 ++--
 .../bindings/display/panel/pda,91-00156-a0.yaml    |  4 ++--
 .../bindings/display/panel/raydium,rm68200.yaml    |  4 ++--
 .../bindings/display/panel/raydium,rm692e5.yaml    |  2 --
 .../bindings/display/panel/renesas,r61307.yaml     |  3 +--
 .../bindings/display/panel/renesas,r69328.yaml     |  1 -
 .../display/panel/rocktech,jh057n00900.yaml        |  5 ++---
 .../bindings/display/panel/samsung,atna33xc20.yaml |  4 ++--
 .../bindings/display/panel/samsung,ld9040.yaml     |  4 ----
 .../bindings/display/panel/samsung,lms380kf01.yaml |  6 -----
 .../bindings/display/panel/samsung,lms397kf04.yaml |  6 -----
 .../bindings/display/panel/samsung,s6d27a1.yaml    |  6 -----
 .../bindings/display/panel/samsung,s6d7aa0.yaml    |  8 +++++++
 .../bindings/display/panel/samsung,s6e3ha8.yaml    |  4 ----
 .../bindings/display/panel/samsung,s6e63m0.yaml    |  2 --
 .../bindings/display/panel/sgd,gktw70sdae4se.yaml  |  4 ++--
 .../bindings/display/panel/sitronix,st7701.yaml    |  6 -----
 .../bindings/display/panel/sitronix,st7789v.yaml   |  6 -----
 .../bindings/display/panel/sony,acx565akm.yaml     |  4 ----
 .../display/panel/sony,tulip-truly-nt35521.yaml    |  2 --
 .../display/panel/startek,kd070fhfid015.yaml       | 11 ++++-----
 .../devicetree/bindings/display/panel/tpo,td.yaml  |  5 -----
 .../bindings/display/panel/visionox,r66451.yaml    |  4 ++--
 .../bindings/display/panel/visionox,rm69299.yaml   |  4 ++--
 .../bindings/display/panel/visionox,vtdr6130.yaml  |  4 ++--
 50 files changed, 78 insertions(+), 149 deletions(-)
---
base-commit: c025f6cf4209e1542ec2afebe49f42bbaf1a5c7b
change-id: 20260306-dt-bindings-display-panel-clean-3ddd8e087ef2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


