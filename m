Return-Path: <linux-renesas-soc+bounces-31358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIEBD+wz4mmL3QAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 15:21:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C568241B913
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 15:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45675304D70F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 13:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C86D3822B1;
	Fri, 17 Apr 2026 13:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MSoIMcoc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DCGx/w1i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190E725A2A2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 13:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776432087; cv=pass; b=hnZNp+almuMCi9J9JWdNdcBkWIakH/ZKdyoFgYGzguaWPWgrfsOTQYSBUDSCIpz6y/r2v/Qf2C0iTBWdn7w1b7tLyQ+lwlVlrhiMhAa4XU09SYkFSI1zSGpXPtdgmfgnkfVETP0QUYb3Tuzd3w4DXl97QjhxEx2eNTWuHI/oePY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776432087; c=relaxed/simple;
	bh=kI0N6QQjh0tI4EIny2tcL+kK2lCNv5JgbdSFpCdFlec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=npL+6grMmw7iH/Kz2alGyqGOx3aGh6ysRi46rNYrAuWW2shHPwRmNGcein8893g4vgwW9cgllWPq8MoxdtnG9dYaxfswD771jc/YhpYyipW58upcOp65M3g9xUxHFd9te54D77cVVoT92XjY+BTiA9SL080AqETNKELg+2WFvjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MSoIMcoc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DCGx/w1i; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776432085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vhkR8ww9uqquP99F0+9R4fQYgPW3ejfry8pMlRoU26k=;
	b=MSoIMcocxjbd53eb8lDOJl/j0yF+Cz/N+OdNSgO1CpK9HKEnBaTJzeor3UUwTXiTy2uZf9
	K2h0sTF1DNPrpnJEis9MNWRjTBflF3Yp3sZZOUcBQWLVKfdwQVACik3nftghtrBmSWtDzQ
	mLBqfBhffJEqJCAoqRFpLFQZ89J8+PA=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-a0omBMvzOZqiT0g34DD9Hw-1; Fri, 17 Apr 2026 09:21:23 -0400
X-MC-Unique: a0omBMvzOZqiT0g34DD9Hw-1
X-Mimecast-MFC-AGG-ID: a0omBMvzOZqiT0g34DD9Hw_1776432083
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f67ce97a7so459229e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 06:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776432083; cv=none;
        d=google.com; s=arc-20240605;
        b=J175y/bY6Rqvqmbp1ziBiaDY1FeL5ov15CLZSImT8PCygZATiKB/oPfNjnX9s0RaAi
         HnSKWgBQn1MTS0/FrIBHBT7iMCpBhjPfKsCtjIWVr0btdBFxNlf/CN4ZJqvH0SmjRU7F
         kVcDmp/Q82MG5wkwiRVv7och+B8OOVuh/XvTDI7PnCnVDpyl7AUHkYQop0cd01QejuJH
         Wv2p+7nxJsWh244d0nYBWZJemHzUGFk8JQc3xStFKAIUT9x3QXsHBB/iqN2TyO5IhQVk
         fZ2FlWpCrKt9VIvdqW+VP4p8dhtvH/83Qb5xoJBTJdt8ruyAJMYQgFPdG1juaKV+f7dk
         XRPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vhkR8ww9uqquP99F0+9R4fQYgPW3ejfry8pMlRoU26k=;
        fh=zOGsPhbFyhvPBtLEXuDdUsP57nGFUmEkjSNi82kjEek=;
        b=Yuz7NLhiwPeFeVX1XslmynlYbz7EYBJHB74q6hd83vd+P7MDw3jywjPqb4AWP0gelK
         mj36EeVaKI+wfUG80P89dfbp67O3AJmqpySJfXt758IR6jrjVCCiWTE1Mo7edco+RWF1
         QRkXLtgK9DwIj8F3VGzx54KOHSCGGKiowc2VKy8CXS4lTeIwx0kqAFrsO1OxPMXO8kHR
         J+4ffvk3Bgbsa4IEIkB7nc6lrTN1Jr8KWD8nq6FqoyIW45QIUoJ/GvgFrXn0a40qnOOP
         LmaHXWFwpFAqY7SbxlNgjUrgGciY0egCRqtjQaVni+Ma89GrlC1779lGqCIp+6xl9B2n
         365g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776432083; x=1777036883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhkR8ww9uqquP99F0+9R4fQYgPW3ejfry8pMlRoU26k=;
        b=DCGx/w1itbMuA6yjzfe5J931mGm18c94X/jLhRscBdudH5X+/jj9WQ540fESevYyBC
         V2JavNkhoEXBpXSKuqMC7lNwyolMSSlm3YlelNUrxUp7YhZGQfXwJSm3oDhEhF+hIbAz
         juwEHrxJEkhI/ShjcGaRLVXpGFkIEL1YyaiS+1d98Q0XAa3Aj5R8d57SGcQ67GodBtui
         IPBc65YLJw0czjvzBzrdRSr0PVn9kIlUgCSzkW0t7uY0pWcSRGYhlbbi0m/JkgqzYw3d
         /bEbvbWuKNwN67JvVHCJdQmbu+pJPg2CVEqeq6s94C7+lcCm5rT4i9E6ZOqygeHNXcEP
         MXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776432083; x=1777036883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vhkR8ww9uqquP99F0+9R4fQYgPW3ejfry8pMlRoU26k=;
        b=NH+TVQBcxmm7jh3konGMeAI+w49wGuQ5DgHoBhEZE2As4zVULnmZGcsjaRv0RKtK5Z
         nYkt8UJSDHnu8tAQf7N2nALbrp+z9iYgKE1640KKgY9VmyUKTTRzDNc5X+AxHu93M2RP
         A4gOtRdXQBu2ELD53csfaYiDj26i6SUwzgpcfBG/Q7w1HVy0BTYlmjktis3nvnUfwoNj
         2XNCkveu/8GIp62MUeec9e0WFsSXf16GYSNIZlvuNwa3MXwYEsKyknxrBC7CvktBODZu
         KI4wKXGO+jPrsKx+2lp8ojxU6Dn8JLuZ94AisanNE/M6eu/1fwamJoP4YOwKa5j396eA
         qgVA==
X-Forwarded-Encrypted: i=1; AFNElJ8GDl6XxUx0+3AwtYVrd5NLAZbAeac07OQ3+Gl32RI8Y8d/9Oql05YJtFJE8oUSSY1zgwFxZpjxl2Hh83szefDxlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXQu39upELsoiq/WHmg/YJZH3auDhAQHErXY3PM01H9KNNLPG8
	BmlWmyqlELfG3a+OedG4bwnrwgIQ+DtKvKdTb40uIVU1NgIBWvorHblksa9D/zPwZJiDXAUbe3c
	VaUqFVASNMlLWpj3wgnY+WUudYXw2aUkm6Vx0zuitAkRQloYcAV42GgyOTmr4ACT77elRmqg7ED
	MSA2AZJM0SwHtff+R5X1xb0I5CBOrJNncD/epvJra6YuQJA+U=
X-Gm-Gg: AeBDieu8fUSxUoC6NbywBpw+2GzYS64YBooOTjkBJiotvCILeIHih46FSmL9jDVnFdq
	h9qtbJy9Xjbs0Jo3Tm82LVjrxkE2LPX8EDYgzom64EfoCJ9YWyzpVXIcpEPhhXjWPZ3ihEuFY25
	FFbFNCwndZR/T4W0fzC6WTUZQVXMVskowhi7lQsob6nPFB+NrPI3Ub/amCq7goUNLn8KmAW+QU2
	qPfGQ4KjA+sdU1cFGqES6BU
X-Received: by 2002:a05:6122:4d0f:b0:56f:6d11:b962 with SMTP id 71dfb90a1353d-56fa57fac70mr1252985e0c.2.1776432083285;
        Fri, 17 Apr 2026 06:21:23 -0700 (PDT)
X-Received: by 2002:a05:6122:4d0f:b0:56f:6d11:b962 with SMTP id
 71dfb90a1353d-56fa57fac70mr1252936e0c.2.1776432082793; Fri, 17 Apr 2026
 06:21:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413124912.3260571-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <aeFWGYaRownx1jdp@redhat.com>
In-Reply-To: <aeFWGYaRownx1jdp@redhat.com>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 17 Apr 2026 09:21:10 -0400
X-Gm-Features: AQROBzDWBqSJnk8R9ke7imMJ1S0GHgJWPy1mQjjbiQQkF57D15ZbbfpRJtYXdyQ
Message-ID: <CABx5tqJ2PJQgiHpq=wBrobhHzU9bPgE0A_Y7khg9PK-pZUzX0A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: divider: Add some kunit test suites
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31358-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C568241B913
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Lad,

On Thu, Apr 16, 2026 at 5:35=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
> On Mon, Apr 13, 2026 at 01:49:12PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > +     /*
> > +      * ULONG_MAX is the canonical way to probe the maximum rate a clo=
ck
> > +      * can produce. With a parent at 1 GHz and the smallest table div=
ider
> > +      * being 2, the expected maximum is 500 MHz.
> > +      *
> > +      * Before the fix this returned 125 MHz (PARENT_RATE / 8), the
> > +      * minimum rate, because the search loop was bypassed entirely.
>
> The "Before the fix" comment should go in the commit log. The comment in
> the code should describe how the code is right now.

To demonstrate the existing issue, you could structure your series by:

- Introduce the test as the first patch and have it show the issue and
the current behavior.
- Put the divider fix in, and update the test for the new behavior.

Brian


