Return-Path: <linux-renesas-soc+bounces-28395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CHIEyxYnGkAEQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:37:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B979317700C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8880E3031F1E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 13:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DCF20E6E2;
	Mon, 23 Feb 2026 13:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcS2jH80";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QLVBTPC3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7D51FE44A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853864; cv=none; b=llTdspxPzWyIvi/4caQbqE0XEP95P6PB9lAYVjf7xiwQ4BZPeGG0pj0ad7E6f6xUsHOk7Jo08jNcLdyt9WdtNR2cAz9jCIzilryNIv8+pSZaY2hC6oFIMOcDM9+JC1wrJFJ7mS6bP7Rc8jXpV0rCB8zcxNq9diuo9msi2X0pg0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853864; c=relaxed/simple;
	bh=8U1qrV9VPbA1NurePpOKrOc1y8Pp0LEFx1aO9DiJBzo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cJHmp1MkEj5nToaJzgBEn0wX/wUhRLEOTgQ3hq9wfSDEeBBAEAI8PbMPGTub0QO0sh7Xkh89XuEFwALXfza+hspIpxWSURJQs5zUG/RhmgwtLnHaX2ZL4Dqq453TAPlAu0Sd3Hjix4y0TbxedcfatNVg1Wt44W4TZGp3RaCrv6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CcS2jH80; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QLVBTPC3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NC2lOE3151910
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BPmaMMJCKmfQnceiVQlewf
	F4pWyv++KTwwJINk8vYA0=; b=CcS2jH802qsIIJYTQKLEhIrwqr8D1QKbHK9M+T
	NxhhRoqiHcBMxthLUjI2gG+s3u02zEmYYEw3hPWu84AmQv5LKwdjUeO/aQJDNnRt
	1gU3quLKiTnBAl2CbmFg2N1RLGIrJe/y67bseKH0HTHwN4Tkv+Ya9LJ7H3FBu3zG
	jLwxa1mg94Y2zSYcrRiSqUDAytbyJ2rGyQVqCwM70nXfNjdve/RleIsMiOdlIlEa
	eiyzDSo6PlI2/v/6IyLnlj3ysVpPWy2JBNaSZ8lJILOyi554R6ZU393ewSo8AwAw
	AQIB8AowMsjr2ht1polxdbIYWQvs1Rlqi3ufx8cnu6Ek5Zgg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj887a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:37:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a129cd2so5688048985a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 05:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853862; x=1772458662; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPmaMMJCKmfQnceiVQlewfF4pWyv++KTwwJINk8vYA0=;
        b=QLVBTPC34LstBdF2C7uTqk22XOQsPG4pTRNe867osIPso6bx8rYK6rRkTHGOf1y+dt
         v+BZoDqN17Z/JFq6y35EfaUCfhsT+i1futVDkEUbKgn71AhC7Frpg7EEpuuGEoENzMAE
         R3AvZMOeGCiQz0Ew1vdcXwc0Ff210wjevV4wna2dwJoL2+LKEx6D1JQNhWx3GG/eq/CC
         wx2PtzJVW7i6LeeyCPUpkBkP6Yb1F6JADmESkb2z/pPp5RHbUlEqyuOnqm4WwXeg7zUb
         +rjFjTviOrfs/NnPz5ozJ8XRoFqtBdTOmBA5lkWlgGvqD6+7kQHx7AzAP5FH2601gl/C
         eHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853862; x=1772458662;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPmaMMJCKmfQnceiVQlewfF4pWyv++KTwwJINk8vYA0=;
        b=nqkdalZRPxz52CwbMfTREYVFmxYjpPtgSAlbG+Nij1H6azyF8VQQSdd7Vt3fGLW5SF
         m/K2CuVM1MGGoQzhGpHBtLiKD3o2682W1mfEU0kdfa26qHtrfUXBwfMKiU2rEHteXK6z
         5zSZoqvAmwWJ/zjI34LqHBSYBZZg7LghofbcMBfo8zw/GLeDTrPBTalbYip4pV8IsXxv
         7suo7a4LcH6RaJpLJVTeGGEGOOQmVwkaaCB4IB1cLR8etovftpstfbTZHQ3lM5tsc1mM
         NN/rIn/DlFDw7uCeDMYQFEgMMgrXXCUI6MpXtu4UeVlMsdsW1oakjOFyZVZ8PyhfciLF
         Xy2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWI/H1r85FqqCGbzWV1YqipOgjJPtg5dStCMzsr242LjP/DoDzjuK2n/NpFM3OXAdQ3ptSNqWs44tpnMc1oKeJn0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdzUbyv9Dd9Tni25oUJuI4elIVjW7bp32IIODcHFQgGM4YKPAN
	Zz+08oYK+Gz6xGFa7pLHHpX7dAzd2PhdFTGDpNFd+ePQqvhQiP46FgiOm7AKWmewqhvqW8ClQ67
	vS2uNtljJm/5MNrj4VEiviIsC2MLZKGSF+VZ5AIyU8SUZPwHzDPHGMJL1GCEdG2cF3MD4wtHrKQ
	==
X-Gm-Gg: AZuq6aIOjRn1aQoq2ejjrWeeJOymwmKCfQ9UvMR8HgJtNXo6lYavTLKzbi0PghmUp1n
	Xfbk5kJ7k3YOmYKzhAO1etD92KlLo1ku6rQQpzk0tjUqtB0lfzRFr95itU3r+siIHANaqr2/5+H
	MPY4gFb16RF0hOB6Ai3eGiSQVa482IHF0A6jU3o21UV3oqWSasgH135nyZmxc3hYI9KcTG6wh27
	Q/dWR9KdQP2Wh35vz9BYJVozytesCYlARGr4cIvdRk2DFZ0dBeYnoGZMjMU/79bLfzEDld4kS6d
	jEdWpBTdxjF1BAuq54jN3sUg5EJFCflrbLgJwOqoHgaj7W2Db9pxHh2a+znEkyTW0spS6vwOGEd
	k2dKZihvj3NbJdc0TcCdutqFGrabxoWsBQFrKl6Pfw1tLOofURg4=
X-Received: by 2002:a05:620a:a1d6:20b0:8c9:eee0:db94 with SMTP id af79cd13be357-8cb7bfe78eemr1160537985a.31.1771853861933;
        Mon, 23 Feb 2026 05:37:41 -0800 (PST)
X-Received: by 2002:a05:620a:a1d6:20b0:8c9:eee0:db94 with SMTP id af79cd13be357-8cb7bfe78eemr1160534485a.31.1771853861406;
        Mon, 23 Feb 2026 05:37:41 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/9] soc: remove direct accesses to of_root from
 drivers/soc/
Date: Mon, 23 Feb 2026 14:37:15 +0100
Message-Id: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAtYnGkC/22MQQ6CMBBFr0Jm7ZC2IgVX3sOwqLWVJsJoBxsN6
 d2trN385P3kvRXYxeAYjtUK0aXAgeYCaleBHc18cxiuhUEJ1Qope2SySB4j0YJa2661h0ZI4aE
 Yj+h8eG+181B4DLxQ/GzxJH/v/06SKHCvjPCmN7q7NCdirp8vc7c0TXUZGHLOX4FjjF2tAAAA
X-Change-ID: 20260119-soc-of-root-77c86c54010f
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2582;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8U1qrV9VPbA1NurePpOKrOc1y8Pp0LEFx1aO9DiJBzo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgVUenh9qw3oSpou3F8KSCFXav2bvcRiege3
 sGVJWni6mSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYFQAKCRAFnS7L/zaE
 w5uXD/9yJoDbzqFe8HN69sZX6yHCeFb24ey9/QRxDPVxBDUzo/mC1CmWvU9maHjuUi2DhsZqteY
 vVFK/mvqS21ADpPY9IZMhs9bAmGazA5FS6vLdUNPVB4LEkay288yM5di7NV8q+nibyZUd+hsN7V
 X16nMjmBSYZQcTGiOzDHPBzeSgdWvaMLE3VaEh/A9eFmK4duP55S2ax2luP0asf4iUjas6/ENcc
 kLL8b5IE8GN38bvLejihYDytXYJTc3u1PGWEeZF4cfzmOXpPEd07oJp0xSx8/+OLRylFE69VXH1
 8LAwgPhQSnLbfXneimOOuBt62w9ZnCRFc4hMTIju6Kt4wcigTjzSECjR4kbedSz7coD6p8e7bxj
 CzFz+qCGHaam/FvGnBRN8pDaB4hz0RbNofKeXNlBhJlVpAr0G3X+SYpxc0oHh5sRcSNu2stBssc
 FlqN7icTX1KQnCpSbzrB1rE+vXwxe0uBbzuSj7DaEzGdJmDJXx3ars6mFSunWmWbPUr8x3fsieX
 p/iTxe7StpSNuiucKFnJNzAaPYri1PyLu0BQA8gV5IIZ09OKvMPzXe4pLTe5iL9rZQPda+m7wuT
 rEx+R8qYrAT+W/In7OB3eZuTsNFHzTwavJjw1XOfN7LTRrKIPlvd8OxtwgVlbnz+AXam9TwfM8d
 qTt/p/Jo5DS26nw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfXzYl+nEqsw18D
 ivJnwNdOxI2UWuJn6EHivnCRykRspesdbm8aZRnJOUBZFBn8SkB7hWqBLQHohv0xsNoPTlYd+cj
 OpbP6jC8H17HjDT6hios1fAmz3izsMt6ALz5j4cw1QYqaKcHeSBCEx6voyFd+GiDwchdYg6cisq
 d0uR0fYvgxbfOB3BdDOl6MyZMYJjXzalRfZqZ2nKyXFTb/y0koAUrBb+bcDiDAVfgbO9Cuqgmg0
 4SEbDHku7LaqmJCEu5gXcdONp9MPJMlLZviiGT9vcnm69aCU9s9Y2OdfrrcXV+zR13rqtfVohOL
 YDiFUlkJ92Q8d5KD+BlzqX7Rb7oSJ/mZV8ZfgPL09yMwNyECnKY0jwZJn2ammbeHcPejxdU7OYe
 8bNtTlWDzV43F4kRDQx7TN9fXo0Rh+riW7oBGBhhFVGsiSJtbHxw6CX5u3PVblMi6vrmwPCmpKU
 yCc/CAvBUL3/ktqZmVg==
X-Proofpoint-GUID: NrqqJ8tFRtSDto5jqnDhSRrZy7jLPOxK
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699c5826 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dWNf8gF45q0IjK5QRoUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: NrqqJ8tFRtSDto5jqnDhSRrZy7jLPOxK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117
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
	TAGGED_FROM(0.00)[bounces-28395-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
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
X-Rspamd-Queue-Id: B979317700C
X-Rspamd-Action: no action

linux/of.h declares a set of variables providing addresses of certain
key OF nodes. The pointers being variables can't profit from stubs
provided for when CONFIG_OF is disabled which means that drivers
accessing these variables can't profit from CONFIG_COMPILE_TEST=y
coverage.

There are drivers under drivers/soc/ that access the of_root node. This
series introduces new OF helpers for reading the machine compatible and
model strings, exports an existing SoC helper that reads the machine
string from the root node and finally replaces all direct accesses to
of_root with new or already existing helper functions.

Merging strategy: first two patches should be either acked by Rob or
picked up into an immutable branch based on v7.0-rc1, the rest can go
through the SoC tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- rename of_machine_get_compatible() to of_machine_read_compatible() and
  add the index argument
- add a stub for of_machine_read_compatible() for !CONFIG_OF
- provide of_machine_read_model() to avoid having to look-up the root
  node via of_find_node_by_path("/")
- rename soc_device_get_machine() to soc_attr_read_machine() before
  making it an exported symbol
- Link to v1: https://lore.kernel.org/r/20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com

---
Bartosz Golaszewski (9):
      of: provide of_machine_read_compatible()
      of: provide of_machine_read_model()
      base: soc: order includes alphabetically
      base: soc: rename and export soc_device_get_machine()
      soc: fsl: guts: don't access of_root directly
      soc: imx8m: don't access of_root directly
      soc: imx9: don't access of_root directly
      soc: renesas: don't access of_root directly
      soc: sunxi: mbus: don't access of_root directly

 drivers/base/soc.c                | 23 ++++++++++-------------
 drivers/of/base.c                 | 28 ++++++++++++++++++++++++++++
 drivers/soc/fsl/guts.c            | 12 +++---------
 drivers/soc/imx/soc-imx8m.c       | 11 +++--------
 drivers/soc/imx/soc-imx9.c        |  4 ++--
 drivers/soc/renesas/renesas-soc.c |  7 ++++++-
 drivers/soc/sunxi/sunxi_mbus.c    |  2 +-
 include/linux/of.h                | 14 ++++++++++++++
 include/linux/sys_soc.h           | 10 ++++++++++
 9 files changed, 77 insertions(+), 34 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260119-soc-of-root-77c86c54010f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


