Return-Path: <linux-renesas-soc+bounces-28379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGMGBoUbnGkZ/wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:19:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F43D173C16
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5696A3058BB7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBACE3559D3;
	Mon, 23 Feb 2026 09:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6hZP7jY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GlkvYSWL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E4434D907
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837726; cv=none; b=nQvtPhJy2N1R/HjXnJceaZmW+5HM5bM95czdtNrdIuhanYsEzL/5LP8KMPOZEBQvHE6PwJvtzYzFMUlmt+spTA5bIO3e71AK8mrtnvGaazzE5JZCFDW1lMR0gBqG7cMbDrTYx+Ov7l3kxiU66DTt4X6UBgEQGXXHEPcg882rBzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837726; c=relaxed/simple;
	bh=/GP/zYso5A0SHWvWSzvaIfVcse3lbidG+Y7zPANDhd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dU7yhUdC1fiCkc6TMOwCiKXLidhHH8FbK2y7IenPmGXTt1Sf3RAg9IoeI6/0m8u6gkjCGaNOWFKjQ4xgBuBmvP/FUQpK/zWSFbwRcaeoEomYmkcMB2iRL+p7KrxNhInvKT/JhvpryY0XgjFH4VayIBRaSEU/6GUjS/s+BIvyf58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6hZP7jY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GlkvYSWL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLsKgS2933454
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BDVvuF+FWHEJn6n7VtwYeyoAX6Ys4Day7oFD9Rg33Qc=; b=a6hZP7jYVlBJd6hk
	NL8ZAM0tp+pR4yWxowKTP7uyTIPYaJK6R+Gylr9QIMqx9VuFMr8O8+eYLX/8hbcL
	laJKLF7uOys83qAQOXjGxQtgPUv5NjQ4ngJ3D0i9ukzYmqab2/0lt8/uSeyfb2yj
	0dBufSVyqsdyxQ8Pr6Uzw92THmYNcqO7k6VLSkqWI5GqYfi420fcwuG3JKPWEucb
	2ZqNgqPJA7Y20H9QGXylkNF0J4Y5ptOeBc897W30atL7PHoUujknsATADTKv7fQd
	eIhpCDTkjRh0KICPNOANttwZQgMnCZj7nlbYq+p4dEisPC7QE22Rba01L80LvswH
	0LpJKw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vj41r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4e37a796so3432689185a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837724; x=1772442524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDVvuF+FWHEJn6n7VtwYeyoAX6Ys4Day7oFD9Rg33Qc=;
        b=GlkvYSWLmrt+3AqEZHBj2Va9G6WLZzlVXPcw+m+iSnYqXgNl+L2mNWO62/MWiry9wr
         NTweM66y9o82ORI42r140vD1RokOn0lbwO3c1tN5uQ7APTAHLUBbiPWVoR4kpBJDahGy
         eEGqW7UQs6A8yQUIh7KO0L5xfoIXTKbMtvH7fEIWR0qjQ7R4sOGwBvU6IFP9Eb0xQJyl
         w/1u04r1OoJT9ZHkAnI6c0XYcm+T8hdbuXC5HJjccXxHDUJkt+x4nFdVzZR/fEFu8qor
         sJ0raDX2lh/qQanuhzOneEe06Ozm5qt8JBIafs3l5IJ6kqsw3aypJPIebHIGoyNPNWjU
         h64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837724; x=1772442524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BDVvuF+FWHEJn6n7VtwYeyoAX6Ys4Day7oFD9Rg33Qc=;
        b=Pfr5Tvgn/7pj7H4HptnaE+YC+GeY7EwnNFQtPaP0jbsJ6+rRc+GWqWlqpCf19gN/aF
         jRKXo1FEoRGuQcVVCYlCGuqv3LW1TEpzXAP8QWjnmczm5YIctr+K/curQRYqcDj6eLLl
         es8qZKhXyjX7rX49uJFRTwhggtoxohaUaNEjbjiVBDkavUvSNwug5r7M0Zh3NXqcfk8T
         8GiQFek9+5rTBVOsSNrK38Nq9HGXd+ybRT+80i+3SkEmO9Y21Eo9o2CiJR8fwdPwxftm
         THuHYumQ1D9CnJHN0Crng6BDyguQFClxuIR3Rfnw5E76T6u4Qsz5D9PHxKWEffE9bHQL
         Hblw==
X-Forwarded-Encrypted: i=1; AJvYcCX57cYpe2MqOVxVxQBNE5ezqdOABPQieVJ9J/4eJqtTMPAjiN44M9J14GalZaWNrlPnRju4qLQZYs+yLJs0icHYiA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw+9mpTQm8k10RoQ/3j3cwWtw801ZsjY7zxq+K2SjRpr25ZTEG
	geL2UDsCUQtzIq6quPDPd1NW/6QJrkWYplOxtmmw9K/gNhWOlxSTqR+C2dW1CEtpZrVJtdOuA+6
	+1XJTyT2liCL+hftlAjJBzj0C7TmnXKl5vuFogzuvVCJwemXLj0t7rGxzzH/oDRYBk9GZVhZHKw
	==
X-Gm-Gg: AZuq6aJn3WApjDCyHy/PuPN2xPY0MxO2i7usKCriMbGx5946LeO9TNWatszcptE8ufK
	hTb0PNihUdkRnOR74Npik9sr/duTw9PqetmkckKkOnoy3AnDAUPufJZhQQhXan4VcTIav1doSmp
	XZNQVdXY/DLWuM2kDKdD/I3K9L/kQVwcN4ao/Iqb0t315vBt7pMEUI9n9l8fH6c6eCPTj6qltMH
	aT07Jxuwq5oxWUqfNZ2YJtssJFeAnQBlXXkz8nybZ76/DyX5unTA//Vy9ql6R9zfi542uo2Peqc
	oLg148wSEc6ipvVlPFdNHwTF1+VRCL1CnZdBH39YrH+UJmoVeQ2Sxnje8TpNyGcCyBK34Co1bUA
	fgxtDeIc3H4/M0MIfUWtErF/xV/Rf6NF3zOMhaM5fcMb4RdBS6jzn
X-Received: by 2002:a05:620a:3197:b0:8cb:4013:2812 with SMTP id af79cd13be357-8cb8c9e68aemr943618385a.1.1771837723717;
        Mon, 23 Feb 2026 01:08:43 -0800 (PST)
X-Received: by 2002:a05:620a:3197:b0:8cb:4013:2812 with SMTP id af79cd13be357-8cb8c9e68aemr943616785a.1.1771837723220;
        Mon, 23 Feb 2026 01:08:43 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c048bsm264049295e9.7.2026.02.23.01.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:08:42 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:08:25 +0100
Subject: [PATCH v2 7/9] i2c: usbio: use i2c_adapter_set_node()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-ada-dev-set-node-v2-7-77018c536610@oss.qualcomm.com>
References: <20260223-i2c-ada-dev-set-node-v2-0-77018c536610@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-ada-dev-set-node-v2-0-77018c536610@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
        Lixu Zhang <lixu.zhang@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
        Hans de Goede <hansg@kernel.org>,
        Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>,
        Hans Hu <hanshu@zhaoxin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1086;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/GP/zYso5A0SHWvWSzvaIfVcse3lbidG+Y7zPANDhd4=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGmcGQ3I7Tql+V7x2gfiyD39jbUZeefr8fEtfBNuvzVQ5ibQa
 okCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJpnBkNAAoJEAWdLsv/NoTDEmwQAKUH
 MGIlAAr3gIg4SW1aQlzeYmbNiYRNL/K7EngVxjcMqfDsr4cxRgUqg4BKqF7ZN1gQ0mJNdikqK1H
 hsSVGKFnTtD4ziJZRKpCR7nnBLx1lOpB6L75j77D0455TDxN0UrwApffMLFLk70S0bGoyGlGaeJ
 NjRgwJzpoqHD+Bx5LEMU7YRJRJSckSrNRl9vir7IPZ8aBniXeCBSGQtLmzLTx0rQCoysJI9KAae
 P79LwLt6KjeYjtLMqjqw9NA+PGPmrjtckWHDlylbHE14+87ytK2kDv6QlOTRSpDswzbPiFWOQXY
 K6BzzyVgKZhxqcF2X4VrQutst9qbytRS/fgt63HAOoyJ5Y50M597+3zOmsyuFXzwMi9nrhV/Y5H
 uQ5wmuq6OAfImY8craiRiJMeggG7KPErJRmETLw4CsRwx6Bg5ubGwJ4162jaBmfk/sea7w10nDp
 od42d/Wym/vtjnDH9dvaZ31mZQvp5S5TXHypI0Iyw88SM+7tU68TAxhO+6W7bR8Zn78/R6qyV2v
 RWbePeRxqY7TFmGATE/PZaa/TTN+iF1GZT8Mmx9rhx54C517yaogG1gvZpYUMi3djfxrHQalG98
 kzWUrCd6pZm+gmBhuc4CCbMhOc1Wl5aJCAXxRZrYyoVBzRXgr4VZTjMOqlMOMNn9/mGZatbopyt
 7v028
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX/rWq5epWc8bx
 KaMNZ1CB6BGcFd09e9Za1/Wz4HppvTofDHTcgTgB+n+eLQcdIpHHmpTSjjRhttTYhYCr/GIGXT5
 +o+MJYnfDixihMwKrL0Vm4YimO3/B7iMROpJMa0FmDbtpHogjk4PDnTGWpdHKJFA/PRH6RCvYaQ
 k6a3ZmncKQZbzlYy7WF7HEgCy/zZkGVpwUxBUHAMOuwxRjYqV19wNSkhamYVBScPnb9FyMm5uzE
 GjJaCJEJLzzSnB6PMpH8Lj6OtfQldccVD/PVVTkhD5YGBe4EJswsPvtBNVfe5FHks1dUYmQPggN
 iuFHozX0ahYhmx6gvemPlXv+xMaFTVb40ALChglbrlQjk52ueFdYRtelO1RkKq6IfX7jqCBgD8j
 E5haxBy6CmZff3PHYV3PLjc3r484S+HJG+zgnb8MaynoyfmSsLQAjsWIWb7/H0c1eYAvN2KWDdC
 Xm114QxulcjOCUrU8gg==
X-Authority-Analysis: v=2.4 cv=T5KBjvKQ c=1 sm=1 tr=0 ts=699c191c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=M9yQa1kB9IGsLdw4TO0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: nL6044UB2khufkw6CE3ZwAFrhjMHqJiw
X-Proofpoint-ORIG-GUID: nL6044UB2khufkw6CE3ZwAFrhjMHqJiw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28379-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6F43D173C16
X-Rspamd-Action: no action

Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
This allows us to hide the dereferencing of the embedded struct device.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-usbio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-usbio.c b/drivers/i2c/busses/i2c-usbio.c
index e7799abf67877906c7787235bddb28ac23168077..4824d61fc85d7b23fd7f6a8c2be5809ad9fe2613 100644
--- a/drivers/i2c/busses/i2c-usbio.c
+++ b/drivers/i2c/busses/i2c-usbio.c
@@ -278,7 +278,7 @@ static int usbio_i2c_probe(struct auxiliary_device *adev,
 	snprintf(i2c->adap.name, sizeof(i2c->adap.name), "%s.%d",
 		 USBIO_I2C_CLIENT, i2c->adev->id);
 
-	device_set_node(&i2c->adap.dev, dev_fwnode(&adev->dev));
+	i2c_adapter_set_node(&i2c->adap, dev_fwnode(&adev->dev));
 
 	auxiliary_set_drvdata(adev, i2c);
 	i2c_set_adapdata(&i2c->adap, i2c);

-- 
2.47.3


