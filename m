Return-Path: <linux-renesas-soc+bounces-28398-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ5nJnFYnGkAEQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28398-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:38:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 150461770D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8A5D30612BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 13:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92841221F20;
	Mon, 23 Feb 2026 13:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLRgqxU0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gB8LJRci"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4DB235063
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853872; cv=none; b=VbhSCfjLwwanStkcnK3jljQM8nQcNpCW+MX2i+aEPOzVNVi7h31/eUoDIQGgAFVyWu0T/oew2yvKJX2Dx6ByRwFJSvbMdRqPyGtOt/Byb4dYCoXrkhYTKPcGXzvFYOg0tpEpPzLKsHvwKqz4G1B7CnF36o8GvlXBkrfeDhdVEsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853872; c=relaxed/simple;
	bh=wW8xXPxpKDmxwgZvpOfgeQnchhB1uWOF7QOX2KdsSDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I0Zney8/2zEdGD/Q7TDrKVz2QFmv8YE9L4NaGxwNGv/9OtmijmNpDdopuMY2TjPH/VSY8SbJ7yXjOOfUgoc3Hxzbqi5uEx4C7e/pzcKrj0oCCj1Wa3fYSIyhW6dr1F9mrYlt/mQ+by514oOw+J7E9tL+NA8E3sHqKccXPFv6MDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLRgqxU0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gB8LJRci; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYcRW322187
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18vklP2raVReBlGkeSOqpVj0g8z1dYR5oY2LGWvx9zI=; b=FLRgqxU0qrr/Y1KS
	g4uJW9Ub7TsH+DrfVQsrfO6XZAdyrQrdQJoOm7AeUs8wALu6bDJFxZ53WBWayDd3
	LkPcq93G2tl0yx3e5N62VoLN51pMyZAtNgvQc81E+clOfGM2OFzQ1477+MDdVtFD
	8IeOwUTxvti1PBYuEbE5kMpMs5VplU7AkEryuZJC0oHYnfdcgy+jarbsuHXy7+si
	WVvrt3Tsb+Q6j4qUAHnU4HwFZvZg1RkAvPEH2m9vDhq4RYZ4gAOj9Nc4xax3AYO5
	T3+PpQ+figj+SRdbm9kDpEQKRP6NfHqdi3aqb/U5LeGrke0m5J+IDGCrU1CgLn2r
	YhP83g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y0fbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:37:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb390a0c4eso1411261785a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 05:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853869; x=1772458669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18vklP2raVReBlGkeSOqpVj0g8z1dYR5oY2LGWvx9zI=;
        b=gB8LJRciccVdQIpQJpwni8ZrnKuJVvPNwfW2WXqZcxyRsH1OFu+xSTpBawN/kPRHB0
         3MG62BEJgDWGOr4BtoSGWaxt+FaYayPen0z1iiZtAN7/A6M6PXKBEX2Ozs4p6NPh6IHH
         WEHK4PPRYPed2p3PZxLaz4Bx/Q33bChjyu0GTKOyb1228c72bUpT3BA9F0Pcocl6KIcJ
         f0J3ddpo2DKQ1JFlqw7XCh3EKmd8N74q9EvdIKm0uJH0KoWO5fvuHGP6s+aPS4gPl9cD
         hoSliZXRBwV5Xr6FztGoFgMDkGhNKd85czo5MpookoSJ8sPd3qS6WFVABbPfZTz2PLC4
         cviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853869; x=1772458669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=18vklP2raVReBlGkeSOqpVj0g8z1dYR5oY2LGWvx9zI=;
        b=P8ovK1TJvuamyUxATiAgkSmg2e50EEIE1C3bx3SLo24oXap80QykigZreASzba66nA
         jhnGI71XnuZJwECnOaVwIg29m07mA7J7lIn6xEQyriyy5DtR+r7V2t9RpSXfLBTvkMrG
         5M35PTziRdQ1qwHdvyuTS/8mdS254elp//h1yrQrLi0JUcXWuUKI/RX47p6OYteyf0v9
         XOCFoHr79WpsGwSM6LAMk37Edm/Nre2p1jR+fpikTZsvELmyC7AhzEE1JIE/x2nzTSBu
         6/2mcN7HowfrZFIRza3rYkVOrTD62t3yEySxPT8/TADu4WdZ5o3O1Er1D/omEw+29G50
         qtlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmP21M9zqARFF9BEiNg51q6OSPcnxbZA7VH7DatEiyY6UXiD/GV0qMictJLNKEq4/P8EClzF3Tp9bNrmjtUNLbDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyK55ga6GH86bvTa2ZVHsBuWsf6GWp4QNf6Os06J1kWfOKdcn6y
	wQgegN3pwJ7edhG2b2HCCb3LYMsR3YPQEFpQswngC6eaL3R9Y3kp5NTkbzHxLNpRNVouTmhp9El
	zPUv3/Ld73wtmLvY2S3j+pmVe/wPCVfAHjJywgNyXkNQ9eneNLfM8hVdFWqb+04+nyegzwMDYvw
	==
X-Gm-Gg: AZuq6aJOIGpCTTcCuEo2p6qzBWjW5AXhSHwoSzIojZoTGgl4fn2W8BljwyCk9WDnqAB
	tF2KJJrL2f2xG0POe8uqgZY1EiEH1ZXI5hsI5wX9BFq/mHprtUm0xVEMUhPHhaaANzCY3+uzQ9X
	c/Z9C7n1Brbj7vByk7nH9Y3ZQQ41YfbY2V2oy12zzpwcuovo8lSSvtGd7jF5p4dHhx5Wto7W0+K
	X92ejj0MXFpbkJjLppoqMjT94LIj9DBupBtW8ITImMCXoLHyf/718ERlm7Ri9sTMIoRFPe6HoRh
	Or00vN++5HmNYVBa+9fjJ+b5ylwgU41TEcJhrMHh8ctQ+VK2pCnMGVI3Ph6k7KfXpdB+7va5qmU
	FFNpDxWc1VdyVVuXIefj5CXD71FyN4N+7fmSTIInJgupxQxDgWNY=
X-Received: by 2002:a05:620a:f0d:b0:89f:7109:185f with SMTP id af79cd13be357-8cb8c9fe268mr1118018485a.31.1771853869255;
        Mon, 23 Feb 2026 05:37:49 -0800 (PST)
X-Received: by 2002:a05:620a:f0d:b0:89f:7109:185f with SMTP id af79cd13be357-8cb8c9fe268mr1118013385a.31.1771853868814;
        Mon, 23 Feb 2026 05:37:48 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:18 +0100
Subject: [PATCH v2 3/9] base: soc: order includes alphabetically
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-3-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wW8xXPxpKDmxwgZvpOfgeQnchhB1uWOF7QOX2KdsSDE=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGmcWByg57Obv99hS6Oh69qse1rMhM733ND3/E5jFtmsA2uzU
 IkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJpnFgcAAoJEAWdLsv/NoTD9nQP/iPx
 B1jGPMqwhkHEFboaz8rKRAWDcT1EXyqV3r8zD8iUz1itnruVo9pkg7K0BTyjjjY5jJXxGEUDyln
 5VoUzvDH/4UR2c9L5gRSHhIlCNZ/k9h8n8rgrYB4Mw/4uOeUYVbhVorTpB9Bodbet2Nmh0WNRme
 iE1SrqmavcP+8nxdt3TosgeYOpFlYPS081Q6+PesWWEVMJNuARH7Fuu2cEZvFsCdPsQciNidWVe
 o2v6Sku7JRVbV3A5H/WE1A4N+zumd5+HNWXHGCLD59q/bhf3oiE9utrugRe+YNQiK8VDZ//nxsx
 UQHrtF4bWww7nKIfFEIuneWOLnbhwSMfjhVQ+7IOqvIkP7FifK6T7dxXThCPv1DTl29ZC7WlyA/
 +P+f8FyN4RpOjggJV12eAGSlynnlvk3mI+Ht1EMz2Rc6+a6pCsquzO0s3U6ABvvA4e9gTAGwOgN
 DoLLxLkJzKFNpXpfqp2zv6cMc+ESwl9TpcUSwChH6WG7yBbwAFKI9e5RRq+dNjcabAarC5DnVLV
 HxznKM0rD1zonz2rKdFy3LvcKc5bdjNY0RrgCDkOo8ijSqxWItBb+JBOGz6d9qVHLf3zrS7mUrb
 6tqTLtWMrWS5wHUlWC5rlXEDZjHx9qFqQZDnLOv8xP45umlVi7iOdAAp81H3/qSBWTrLDPe+Vz9
 DLrZp
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfXwmyMdfzQ4j/1
 N4P7a4OTNM+NbJ3wKj5ML/7ipySSKIHaKquqI8XPm2pwbvLmtHxBBWZ5ODdYi2GnaiTqypIQPoV
 MBsTDlDrgFfmCf47BBkj0yjCLUwDAZfli7FLL0D3tDZ22BURHR3qITszv4SPUiflarSLTfTXXws
 r66NvLEF7N4xx3PExnlFCshLUUuK7/jIW6YWixtlPsxsD8ew+jIzQgcQMcsKOXi4ZlBta5LYyvZ
 Ty5weJuHfge6kBjY4PQm80VqiL233ocpkvL+NFuuOX3AyEObqSZOCJZ+3NADVcdFNQQVAXBIFzF
 JdQIzELkpX8xtTGPAPyOxLIlE0HPLDskSqqyupWbGK3gtggaUGtvCozdIRwKdLc42KsP43G2xH8
 byEghCpBJ9LXqkyohcvZAGzpun/tsIBYT/OpiHcvV26OFgTWRHbG6g+xvP2NbpNTZIY+cSmixUC
 yQspWnWn9HMcNvpBI5A==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c582d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=LcgYCWfw0sZjbfGval0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: h9gd3b5Aer6mOkfB07OkVh6qqrWY_3rj
X-Proofpoint-ORIG-GUID: h9gd3b5Aer6mOkfB07OkVh6qqrWY_3rj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117
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
	TAGGED_FROM(0.00)[bounces-28398-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
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
X-Rspamd-Queue-Id: 150461770D5
X-Rspamd-Action: no action

For easier readability and maintenance, order the included headers
alphabetically.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/soc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index c8d3db9daa2f02c93aeefda9dd9c5ede148a676f..48e2f0dbd330b8d402135ffa7308f454eb4ab7a5 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -5,16 +5,16 @@
  * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
  */
 
-#include <linux/sysfs.h>
+#include <linux/err.h>
+#include <linux/glob.h>
+#include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/of.h>
-#include <linux/stat.h>
 #include <linux/slab.h>
-#include <linux/idr.h>
 #include <linux/spinlock.h>
+#include <linux/stat.h>
+#include <linux/sysfs.h>
 #include <linux/sys_soc.h>
-#include <linux/err.h>
-#include <linux/glob.h>
 
 static DEFINE_IDA(soc_ida);
 

-- 
2.47.3


