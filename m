Return-Path: <linux-renesas-soc+bounces-34762-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wfr0DITUS2oebAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34762-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 18:15:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A0D71317B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 18:14:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TvsCTFP7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UuikW8Ko;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34762-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34762-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 055C83321E8A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 15:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB103BE642;
	Mon,  6 Jul 2026 15:46:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B853B0AF0
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 15:46:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352797; cv=pass; b=Y888ez7A6VwYkjdnU2BZTzUHQjS/9yeivQkPwCpWfLnLMepwGiDvn3jRbxQ/l8OWbAIjfs8MwWe8JoOGvDr3yLcrP1IikhGbzPO4ef5ufSOcMhJF8Pe6vQagBxzpkTLox/nE/feHgdH/8mkNoDQq+4+xLc+4UblcLywPAMImkSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352797; c=relaxed/simple;
	bh=Yl9YF4C0szpgxpM6nmjLhKwOILm5ugHAFGk2LDG/naI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DrRS0vXDGejY1iwC7nU5do8hVka+dIg9m6btAcoejKhmq6VCnwq4Tg7/p5JKN5eSkHXmVmFPyDEilgZfZUdX0sjKFUzCnH/EFBtp8CKCmXIQDPAMR5zBg7YSqjowWB5K8qMkZggFUVHWl4rQKPFX+XA+sWyxUiEpFQHEwNPj0Wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TvsCTFP7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UuikW8Ko; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF2Lm825763
	for <linux-renesas-soc@vger.kernel.org>; Mon, 6 Jul 2026 15:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5lQxlfMYGfx6hjmWG2TXwuI1j5WcvzVDOnU0deR3wI=; b=TvsCTFP7y1naEBYV
	urhWRcaSe+2zOFRHcUEW+RsLUJ8JHsvGffoPjgKHzAD2OX3biG29mbGbyC/5zdtJ
	3dQw49Ep/rWUuHgwGjKdbe1xITYkOnlIsRCsw8e9xHuIaltBj/+8is/k4jFdHsNH
	NMXfGKv6og5dY/XcyIdjniJYj9nmJBnhtN+HZ7uxKypQwRsa61UlnAuiu1C8NxDc
	Ff6c0XBGfJ9RDBvjJZlRz/lPMBO4TdN/lx/bE0Nno6TuLplmm4kyDVYOw4rTE64d
	netYvYIiWzJKq2lENJYVGAkE3eVd74vt2DNce12Z+yeStnjER4fOnvEj4Iprq/rd
	zHXqYQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t89xy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 15:46:35 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73883529f3eso3022203137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 08:46:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352794; cv=none;
        d=google.com; s=arc-20260327;
        b=nRpM3g+8ABNfjThw/L1VTULuTAbsMD6cKLY3BPV0pnB1ExxFBni5rCh2pIpkipuRmy
         IwVLJ6YCyUmyrLXvhpzeRl46XzX/q00trv2+Bgnz242470gWplGtinQvjD9+1CcJYng+
         bweuKd44rcL3vqq1OvlfEQ94woYLSk86gZ1yw3YuzcC3cZIIvBY3ZE22ra52hoNy0pll
         MUFr1mFsbdE+4WJYHRx+0DBjmPnAunEQmZbYKO7vwqHckj5Jsu6uy0rCtp4XxrZmKmkj
         37I3QCwc0AADwKWH8zwyp0LygdenD0EiaqFkelK03ZAKOXdCtigEBTOW89QdkZHlap1b
         xfRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y5lQxlfMYGfx6hjmWG2TXwuI1j5WcvzVDOnU0deR3wI=;
        fh=gM10yrt/wmuKRGPaB1HKsGr7llG7Mk+s7SEkukIEvK8=;
        b=R83I/2gygAAmhee55PAc8Lduup9HFT5IsN+FGt0Y3fLRlck979K034xFjyCkGg7tG8
         U0ElLqRKGT26RDWNqx8mGrTB+HvKJ3/BdS5NqAvD2aBVW0sS2R4pTu0864d3zXldEfyO
         zWz1ArpwH+UImeYuNg1RHMcEOBV20EIiAF6kLXu1wOVKbpwHgR79+unJRlZUkg9lkOmC
         tRhUFqg8NgnsxwdhENoezJRqMsbOoSZ/TC7EtoZ8EuzsXOgVqvx2tCUfT7npf3VwLIWn
         jK5XnmPLFUb0b71BdYQg5gvVsx2SgZljMBP35RcQpFJoiBbfmb4DSb8Crk6sZI1O7ipF
         TZxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352794; x=1783957594; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5lQxlfMYGfx6hjmWG2TXwuI1j5WcvzVDOnU0deR3wI=;
        b=UuikW8KojgpgHcwwh1W3psu2xKiRNWotRgY7gh4Qi40P7JEmARNziAzHex6u21K5ys
         eQUEa46YJ4NIll8jNY5YxOhX+MU/2E+2hnQb8pN1Pvt5LHallFhbZkJ26G9b8J0pZD1k
         7SvtLxrXqLGdTbngsShZI/Z0PSxB84Kg4c0+x9VhNscG5UabOI1CzhGl4KEWWAZec/zg
         ugp6kESFU7s0OB3qp14mqOfByQDxopXlXiN8zZ07OZon2qbt7wRjVuio1/k5GztoymU2
         0GAxQ0s5UrZONSRI8Xw26y1kemjiPBFwteeHrgYf9DK1zGEdTDepnfJqeIaWDsrsb7PE
         Ympw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352794; x=1783957594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y5lQxlfMYGfx6hjmWG2TXwuI1j5WcvzVDOnU0deR3wI=;
        b=cuH6rJu0PSI8KbAywL81LhaRgK3zwmUM6PzKBcUt1JeWBBh+qqk1ouUBbNAZIRVQ2T
         ta84GqUxXWqvAi5rfjIrRR6iEKkFjNWvhxqP6Nd4CTKM571Vh5JaI5N09tmuChYdo3Z6
         Q0/JM6XqGzBaMvrOmKWRC6sT+6Te+P2/HKcYkGl+mH1/4wm8RCtJ2fa73XfBM83Bm1YH
         jgHPRbyPcE58OUCqXlvWZODLk7yYP+A097hRkb+KIYUIo/wYu0+HC3ym4EuG/Wsn551r
         kyXtewweDeMxVW/dmPtVal8/lKmA+CL4Ezx4i/PBZMQhS7QvPwNMveh8q1ck3DGov5LU
         4hXg==
X-Forwarded-Encrypted: i=1; AHgh+RoW5FunrrjWAAb2XRkT/hwVGcv9XwXOz8WZHE9w4XSWvn58dJM/NwchJpx4zk/lqq20yfLXm4tUGZvG426CywoR6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjH4u/T5c79sRCiX/pjgRHxGOI4NR6303bjikbVJURUy+jSIs9
	jgbBR3FWEqEdPAnBJ9BCjzK3TJ6P4xXLGLFwMDiXUZiSV5TY5/X+7vAkyhgzj8gfIi0PsnBctYJ
	K10T1fuoxYrkIlpGwsgJjJEsCdEUzqggJOGmKRNyJ4xpHb+K47e63hZBKlmxL9rXIS2Z8ad9QX/
	ISngrGV3ME+a5A02QzgfuL2kSmeUG7TsN73FJKn2iQxDkna0Zo
X-Gm-Gg: AfdE7ckisa9b6eFs/tjFiv9qeb2uFXeulr7hwfmfEDdwyk3kpmqqoxivFtuVh/kZduQ
	q0yIPvMWfByM88YYLdXYAhECfhZr4CCfoaWrMWoM0SauY6a9zObfZWf7kxfsq7n4a0E+dTJXgVZ
	qbWKTQGQbwyawscEJ9b1NHOVxTLMzBD7w0KORw+/RXrmmxYyYWlMzgWbiG+AOrl05UYHzQ
X-Received: by 2002:a05:6102:8011:b0:737:b586:6388 with SMTP id ada2fe7eead31-744b7d6e6d4mr649115137.13.1783352794202;
        Mon, 06 Jul 2026 08:46:34 -0700 (PDT)
X-Received: by 2002:a05:6102:8011:b0:737:b586:6388 with SMTP id
 ada2fe7eead31-744b7d6e6d4mr649066137.13.1783352793781; Mon, 06 Jul 2026
 08:46:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602201344.1809801-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260602201344.1809801-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:46:21 +0200
X-Gm-Features: AVVi8CcZLsh5xTCrQHeiyj9VO502FopUmqKqBqBBuThiWnFty4WMAnpf1TVTeto
Message-ID: <CAPx+jO-fhBf+8T9oc6CvsAfJu1Jxp0iE=rregHJ=HmLRCvTFzg@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: mmc_test: Fix __counted_by handling after
 kzalloc_flex() conversion
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Petr Mladek <pmladek@suse.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfXyaxy4EKrcPmk
 j2FlWQm9qukiSzS3EAUfdmiXlgAie6NDuP48ft3K+Wuz69jQYraUfy+LZ4e3TOqz9Z1tCxv/9Ya
 jBVz7edGtmNiasIaQ+MKunEkrzdxg1o=
X-Proofpoint-GUID: VzFRz81uEYdOSEtn2hqwSDiPmjs3ukaG
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bcddb cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=yC-0_ovQAAAA:8 a=pGLkceISAAAA:8
 a=uXk8S0VtEpXI5GqmZSYA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: VzFRz81uEYdOSEtn2hqwSDiPmjs3ukaG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MCBTYWx0ZWRfX6S9Ljiu2EZ4I
 pHkDEHvIeLG0gxAvlbLRhR8A3zmEndB0/cokPNYHBRPKK45wgLnIdXGFAD/S93eYVubYKcCQzEB
 arO45R4Z7E7SeYynU5BWj0IOOQPr9gwXtXL/7KvxfMlHyLl4JGB8e3Q809/Lo0aVXD9h5IMf814
 Syr2Ps1svGzA+7E9xQsXufqLM5uOezbSUMMxJ254JwnwWEe2Nsiqen5NcFcJMTDTjK5ZJmHJLSs
 cg8hWLnkPE80c0nz6wcuFFrsgKPL6rw6AKfboJaXOo/GrWwgSVwCLmTxqQ2DoNRZrly+vxKHpML
 3BAG201DlpTdDBUviOHhP4spdy1G0uK0Zbo0kwhj6sbgawVxIlXrpL6miOhGsEx0FeMMcv65o/x
 HYkDTDgpft+QNBy9rbBOixVZa60t9YSdNQ+RJgX24QMLb93zFB93T/gqU/KoLrhPtQmzZii288r
 /99GNxLCQlm5KJlO3IQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060160
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34762-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:ulfh@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:pmladek@suse.com,m:geert+renesas@glider.be,m:linux-mmc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ulf.hansson@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,mail.gmail.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87A0D71317B

On Tue, Jun 2, 2026 at 10:13=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Fix logic issues introduced by the kzalloc_flex() conversion in
> mmc_test_alloc_mem() due to interaction with the __counted_by
> annotation on the flexible array.
>
> Bounds-checking sanitizers rely on the counter field reflecting the
> allocated array size before any array access occurs. However, use
> mem->cnt both as the allocation size and as the runtime insertion
> index, causing incorrect indexing and potentially invalid bounds
> tracking.
>
> Initialize mem->cnt to the maximum allocated number of segments
> immediately after kzalloc_flex(), then use a separate local index
> variable to track successfully allocated entries. Update mem->cnt to
> the actual number of initialized elements before returning or entering
> the cleanup path.
>
> Also rewrite mmc_test_free_mem() to use a forward for-loop, improving
> readability and ensuring only initialized entries are freed.
>
> Fixes: c3126dccfd7b ("mmc: mmc_test: use kzalloc_flex")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> v2->v3:
> - Switched back to v1 version of the patch.
> - Addressed review comments from Geert.
> - Add RB tag from Geert which was received on v1.
>
> v1->v2:
> - Started with cnt =3D 0 and incremented before assignment to ensure
>   accurate tracking of initialized entries in mmc_test_alloc_mem().
> - In mmc_test_free_mem(), replaced the while loop with a forward for-loop=
 to
>   safely iterate over initialized entries without risking underflow.
> - Updated commit message to clarify the issue and the fix.
>
> v2: https://lore.kernel.org/all/20260519133025.618255-1-prabhakar.mahadev=
-lad.rj@bp.renesas.com/
> v1: https://lore.kernel.org/all/20260513201315.3186621-1-prabhakar.mahade=
v-lad.rj@bp.renesas.com/
> ---
>  drivers/mmc/core/mmc_test.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mmc/core/mmc_test.c b/drivers/mmc/core/mmc_test.c
> index ab38e4c45a8d..4dc16649e61d 100644
> --- a/drivers/mmc/core/mmc_test.c
> +++ b/drivers/mmc/core/mmc_test.c
> @@ -318,9 +318,9 @@ static void mmc_test_free_mem(struct mmc_test_mem *me=
m)
>  {
>         if (!mem)
>                 return;
> -       while (mem->cnt--)
> -               __free_pages(mem->arr[mem->cnt].page,
> -                            mem->arr[mem->cnt].order);
> +       for (unsigned int i =3D 0; i < mem->cnt; i++)
> +               __free_pages(mem->arr[i].page,
> +                            mem->arr[i].order);
>         kfree(mem);
>  }
>
> @@ -341,6 +341,7 @@ static struct mmc_test_mem *mmc_test_alloc_mem(unsign=
ed long min_sz,
>         unsigned long page_cnt =3D 0;
>         unsigned long limit =3D nr_free_buffer_pages() >> 4;
>         struct mmc_test_mem *mem;
> +       unsigned int idx =3D 0;
>
>         if (max_page_cnt > limit)
>                 max_page_cnt =3D limit;
> @@ -375,23 +376,26 @@ static struct mmc_test_mem *mmc_test_alloc_mem(unsi=
gned long min_sz,
>                                 goto out_free;
>                         break;
>                 }
> -               mem->arr[mem->cnt].page =3D page;
> -               mem->arr[mem->cnt].order =3D order;
> -               mem->cnt +=3D 1;
> +               mem->arr[idx].page =3D page;
> +               mem->arr[idx].order =3D order;
> +               idx +=3D 1;
>                 if (max_page_cnt <=3D (1UL << order))
>                         break;
>                 max_page_cnt -=3D 1UL << order;
>                 page_cnt +=3D 1UL << order;
> -               if (mem->cnt >=3D max_segs) {
> +               if (idx >=3D mem->cnt) {
>                         if (page_cnt < min_page_cnt)
>                                 goto out_free;
>                         break;
>                 }
>         }
>
> +       mem->cnt =3D idx;
> +
>         return mem;
>
>  out_free:
> +       mem->cnt =3D idx;
>         mmc_test_free_mem(mem);
>         return NULL;
>  }
> --
> 2.54.0
>

