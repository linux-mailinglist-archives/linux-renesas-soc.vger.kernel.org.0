Return-Path: <linux-renesas-soc+bounces-34352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v2JgGeB5OWpeuAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 20:07:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C559B6B1ABE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 20:07:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KIfSLfVO;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A54F2302731B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 18:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58A03446AF;
	Mon, 22 Jun 2026 18:06:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775AE34403A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 18:06:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782151617; cv=pass; b=lEqmTtASD8r9cdJzNzVnbg9Q6H0Mk9k/fsJqHTa2Ubr2ay5TkGHmYDIU/7HjmfHAGgHEIctW3+MXrf2JN4VeSL7MUHXRxtERJfjMUkzT7JMNqZMEcMGVDPGk4u2JY09JiA6Mxc3kSHrVRHwx5UoP7kiWdRmyvsU90KtWF98QO/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782151617; c=relaxed/simple;
	bh=ZFxvmFaQ3UKtaJOV1aVEKSwCcLraSMIZmP+OOYqgiO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eBdGLxngwWdlXJHDGH4abddJiEKIq+ma1UksmGKrN72Cl6quxAFINjb1vdJrP157aRaQ4CkPMbkdV2/DozCZzg5UtfNdVGc1T2swyWHjb4TfzWuGgFwF8c2sq7bjih5iL89EVTZ/TE0D/EAfcoA6a7T2LZ9MgRDbbV7d6lWE4AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIfSLfVO; arc=pass smtp.client-ip=209.85.128.174
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8051ad12d23so10137437b3.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 11:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782151615; cv=none;
        d=google.com; s=arc-20240605;
        b=Aqqhk6TvJxos6oCsxRUf9MPDjekXsNmGgzZvB+5Q8hAlnW5qPAdpRbIZ7qGz1+sjtS
         1vJcBSs+h0CX0o/VriwtNKV2a354rlFMA5vXaRZTtGJhndAYlKpv3BkBDN+vohSEzsZU
         ChEl9itX9hOM5mEZWhUddf8nCZ8Xi8WEhsvefaAPbgbZlSU3nntzEa1Ey1u4EbmQxaJN
         QDXJsu2DjCz2oZi8muDtvedtP9b70vV2hr45+CMA7pMrBGi8Lkg2z+ahtOPt2wiZHPjP
         YtoeZnmxtRv9g5IDq4fDLF0JA1SYOjiuic5rxarqoQsJSkfkNRL0Lpx1c4p1TTmkCU3R
         dqDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZFxvmFaQ3UKtaJOV1aVEKSwCcLraSMIZmP+OOYqgiO0=;
        fh=VUk1gPnkorsA+VWwAmb54Q0YtO5dnHtfslOQjEiC0AE=;
        b=i02DGR3sOwM1mIzBt1YjYnC3201vmZD4WfZ2KiTns2QLuxggDBOlicMmYoHY+SS34L
         eiRrBfmo3SC5IKwxbiavbcbywYK6hszDYtDBmUR/BICJu+IIFb13bGSnoamQrMbo6SCj
         I/J0IPtKulpZa6qCA3i4nFzIteKbAJtHp3d9MTnsQ3t+B/KnlPhwDn7wepipuErPLSLm
         5xswAV82rXPJwtd4cEIuDVsfF/I0cqOMkTwmfbfRN/XI1zrXRBznm0Cu6ZO6nhL0EVWp
         1ZaDgJ4wYvvTNXwRnn9ugKw5PUIvYrLo3GQmF1NJ4xMdiyZUWBRH7ipW5XHRqhJNuTeg
         rGDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782151615; x=1782756415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFxvmFaQ3UKtaJOV1aVEKSwCcLraSMIZmP+OOYqgiO0=;
        b=KIfSLfVOm8KsT9A82s5ROm9QBP8t9Zds2i5OsP6d+EQPoeM7G26Ms33EuV5ShUKKdq
         Ch6mvIGICI4gZm3DFc+AlG0YxhnAmDl+VLGwqPXR2VOydC1fuYh5i9ii2xIJIwseydQW
         bKRVIoS+RRhwDbaTA6uCUMyLteFkEiwZT+gDnl70eyRJCrPBOopANpffyIAsvisRcQKm
         VGouskXQmVNMnkG60rTfD6LGnoVfeF6qwRxM+xpVgQMI6xmw01T3xsaKa/5pDcOfTJFW
         0cJFAADlElcOP98E2fKIQ3Slt4FxF7ODW0C7FmpRMd9BWdHjrWRi3j8hC2HoFobwOeTm
         tX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782151615; x=1782756415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZFxvmFaQ3UKtaJOV1aVEKSwCcLraSMIZmP+OOYqgiO0=;
        b=Y0aXJhBbvPdvndy8EctHZ2rLI6j+bFPS41qi0qZ0LKxviQ2ZK3u/AM9KUoeF3Q4UUT
         aUh/+7uQnXTZyvIsAuhlFNNpIdmEhwp5itAY4jw2x64CbyFR3uFXvfz1R7xwO124XsSH
         KLo6qIzmEP2NwdHw/IfP8SEA5PJ2VZc6sGSZVJzMR8ONEXUqlySCuHpi//4215ydEMyK
         TNLlBaBWmjpuYWq4WJ9TmhuPG4ZSJqVoaWFmRQ6PUYVQbaGL2q+G/5DycE3xIOrkzeCB
         vkuR+N48PJ1NJsQLlyUimwbax4jcuKp0Y+Ubb5f9CNOMO1HQQnxZe/RXJwTa/QRTN2Ru
         Dsxw==
X-Forwarded-Encrypted: i=1; AHgh+RoUa7heZvJ5ql+S9o3cVjtyARPyPj+yHAWgTpvmKtpHIjOlU06TOrhqBpYZJxWYsVkPyGtevxRE/J7pWkJHYPOQYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YySqDDr6BbVr6xP/grIG8Lpu6f4e/s/1RqjfLfsE1FfK7uJRsYd
	xgqyLRawojHGxyUv52l/4brzEBCYGVuA2CGqVRSO0pAN+tx+4btJdhb0DGg2aWeJ3ZLI/xQLS3f
	WQTlRucLVUnE9otmtnSRyTTNBtBBD6JY=
X-Gm-Gg: AfdE7ck+HShXgIox9kgJAqBLhJsGIv0i0OgaYV0tCwDmStXg960sWseA758bn9zxVB0
	HKn35R1mIpdGzEnxzd9GADYUXZM5/fkxt0jntDHb37wFPzY2lXpl/XKj9UGM0EShP0lFXO7oqmQ
	dgHrfu4Rl7jA7PEhZjjBGv0ppLKV4WeWeGYWRDYzd57XN6SB5V1xMJzCNkghHSNPA0Eur4h2X1w
	7NBiXL51fnIvWNX6mKVIiLA9Y2setUEq9FfAT7TKxWsN6kD9iixN5WqRtrR5dVkAaIZcN1s
X-Received: by 2002:a05:690c:dd4:b0:7ff:13d8:bc65 with SMTP id
 00721157ae682-801336f584fmr168668297b3.39.1782151615292; Mon, 22 Jun 2026
 11:06:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622173334.60491-6-birenpandya@gmail.com> <TY3PR01MB11346C45BB533DB88E29EC21F86EF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346C45BB533DB88E29EC21F86EF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: biren pandya <birenpandya@gmail.com>
Date: Mon, 22 Jun 2026 23:36:44 +0530
X-Gm-Features: AVVi8Cfx5zpmZ9Ho_2C4oBanSIGqnZrz0LZft8yGHlJJxssbM3TnNURelKshtmI
Message-ID: <CAAeMi9JyHZtZUNjM_Wt=_tf0RQYYtN=f+QgNrJ4ZzC6hFWP-jQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] media: renesas: Fix missing media_entity_cleanup()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"jacopo.mondi" <jacopo.mondi@ideasonboard.com>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>, 
	"kieran.bingham+renesas@ideasonboard.com" <kieran.bingham+renesas@ideasonboard.com>, 
	"mchehab@kernel.org" <mchehab@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34352-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:linux-media@vger.kernel.org,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:mchehab@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kieran.bingham@ideasonboard.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C559B6B1ABE

On Mon, Jun 22, 2026 at 11:18=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> Hi Biren Pandya,
>
> > -----Original Message-----
> > From: Biren Pandya <birenpandya@gmail.com>
> > Sent: 22 June 2026 18:34
> > Subject: [PATCH v3 0/4] media: renesas: Fix missing media_entity_cleanu=
p()
> >
> > *** BLURB HERE ***
>
> Consider patch series description next time.
>
> Cheers,
> Biju
>

Hi Biju,

Apologies, I left the git-format-patch placeholder in by mistake =E2=80=94 =
still
learning the tricks of the game; I'll fill in the cover letter next time.
Thanks for the nudge.

For the record: the series adds the missing media_entity_cleanup() calls
to the Renesas media drivers (rcar-csi2, csisp, rcar-vin, rzg2l-cru),
which initialise the entity but never clean it up on probe error paths or
in remove(). It's a no-op today, so no functional change and no backport.

Thanks,
Biren

