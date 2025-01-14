Return-Path: <linux-renesas-soc+bounces-12121-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 182F1A10814
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2025 14:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5410318882A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jan 2025 13:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C359817993;
	Tue, 14 Jan 2025 13:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="oqCGNPQi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88638C07
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jan 2025 13:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736862345; cv=none; b=XqbtKvKitTinEKdKqEn9nvNgy9fpW5i8uhtbJHVY6ayXId5j+jnCZD16JHNn45A5j6MWppgXHdpHxL2UMSVz934yL/0bAsWmqZ9e8NWlykqZGHqT74LyfR6Wc+mEQUXtDEoufl9NvA84CEv0c+3MuttZtQubW9fjr2Rx8T9kxvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736862345; c=relaxed/simple;
	bh=bsLMFG+J1r7oFl5VogEQPhlrLhQfw/mx5kqBlLHZbS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ipWQ3zzGoGPVuzmitUaALsPJUCqjLWl/IWQvY/l8gMIrSSLWIvHIvr+EjpULLGYB/GMar2w+9EXwB9JR+gWbcfcR0QmVDph9KXfcQ7H4bOvbM5sGJ6E5bvM3o69PZ29XkFpbM+/zAPt6nm1V7UdY11EnXbwclRrr62i0l5XjO/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=oqCGNPQi; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3bdccba49so9337055a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jan 2025 05:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1736862342; x=1737467142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PPw6FpRN54/gYF6MDe7e/niZ0I7JKIP2WTfMVVEs4k=;
        b=oqCGNPQiisd6mQ+SQ/zHfLetNi5mCh8AAUg2LPOY0RHwO/DDhRPbJxenbv+SjnCpfl
         BKQAx9kSPyghzoC/ysFOLDARBUKIlk8dhDwMqFJZJLKznXT/akD2GYYmboZvCmh+QPlV
         CHFYXKgVH4lW7ilRa5Eb73kPZQjCc6Au4Dlzobna3rNFbyQ2zuXQdK5iRPkHTDGUUMXx
         MBx8coEiZQVkYxsmAUFQ/djJ0Hg2m7ANdPClwiBJK3d7C9PJnxkz5WCu16+MXIQUpfDD
         AUKEBz1CUCXPvirGppe5nocRKxwrlTKSQDNyXuOjFL2ZOlXY/J6/UDYv8ub+WCEURMNd
         3luQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736862342; x=1737467142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PPw6FpRN54/gYF6MDe7e/niZ0I7JKIP2WTfMVVEs4k=;
        b=MoqsTOKpx8uhp2l/2TVOvJFKACKYeYxdytpMaizBY3l/MCHd0yXS/LXJibAIYGjYpj
         VA3OmHFo8KhBJhgHFMZ9ASM+qOpHmjE4BP+ZvI1M681YFvAFb/1pbcsm3jP2xe258ovA
         N2/92Pm6r022JyNq4o/vnjE7+k21FUrk3/nVoqqxU7WTnRHkPjoWrc43ItW3bO9LhAux
         DhrfcaQ5IhvI2rsotE8Dz+LY9EGqpc09HSuspWwI4fQTj991EDoX2sFzqpHCnbag5BuE
         F7fIYO+uWY5//1tcUd23aZDWiB/S0IJWTYvSSZIGg6kVEFt/iQ0vef4/Ujp4SQUkR5az
         H/SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSzpC8XSnPu6o3e8zF5j7tPMX6knTDslzt2QzL+zUcufk5w0wsxzrbnZ5JTf2clruDViFIBUchHVLq9lneTK6JPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytefDU+U0H00O7OOAjQEgoScFcHzeVLmfXcmFprHmoW8FQ5vEw
	Rcnfpdqw8xBajDvOIhRzeCI4vWmRrGeh5WJO1dGHx8sehQ5t2Wc1Sz4h6adU0r5uANts6xekz1D
	4cKkd75ETUnpg9jSsQUdutFxyJHvVv2s2L7g=
X-Gm-Gg: ASbGncvfIDTpwSz/+LId+eEmGQM/rFMbAu6ZGwiSktYaXyRnEx3ZTagx9rOakPqNqxd
	9L9mTbobWzn0FDb+P7TSt7mx7/eb++94Wjcg8yDVmRvFsaot5XW0GyA5m/pSh2tws4K9FdH8=
X-Google-Smtp-Source: AGHT+IE+OIdZryYN6cdQrJ0IANM5C4W1bdAokKQCgKQ7axcCcD03TGdAvMbfbq3c/QMYMEyiOqj9G6Nk1y/s+MCGx8Q=
X-Received: by 2002:a17:907:a48:b0:ab2:c1e2:1da9 with SMTP id
 a640c23a62f3a-ab2c1e22977mr2315552866b.51.1736862341998; Tue, 14 Jan 2025
 05:45:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111080903.3566296-1-iwamatsu@nigauri.org> <CAMuHMdXdvAYLi-3Eyt=5LTuDG+7rh5fo7VT9kbG1TD5dLLsvbw@mail.gmail.com>
In-Reply-To: <CAMuHMdXdvAYLi-3Eyt=5LTuDG+7rh5fo7VT9kbG1TD5dLLsvbw@mail.gmail.com>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Tue, 14 Jan 2025 22:45:15 +0900
X-Gm-Features: AbW1kva3pu29N9nfRW3UKRrj3KH10M_890YMRUbFgf-FwaZCpfGktJFFoz9G3ho
Message-ID: <CABMQnVJ8bAF29s_=nusZWK_Q57Ru6vGsnW4PL5j0YE_DdqD2pw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add support Yuridenki-Shokai Kakip board
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Masato Kiuchi <kiuchi_masato@yuridenki.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

2025=E5=B9=B41=E6=9C=8813=E6=97=A5(=E6=9C=88) 18:42 Geert Uytterhoeven <gee=
rt@linux-m68k.org>:
>
> Hi Iwamatsu-san,
>
> On Sat, Jan 11, 2025 at 9:09=E2=80=AFAM Nobuhiro Iwamatsu <iwamatsu@nigau=
ri.org> wrote:
> > This patch series add basic support for Yuridenki-Shokai[0] Kakip board=
[1] based
> > on R9A09G057H48.
>
> Thanks for your series!
>
> > [1]: https://www.kakip.ai/
>
> Are the full schematics available, too?  The "Simple H/W Ref." document
> contains only a block diagram and connector pinout.  Access to the
> schematics would make it easier to review DTS patches.

Currently they are not publicly available. But as you wrote, I believe
they should be made public.
I am asking about this.

Best regards,
  Nobuhiro

--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 32247FBB40AD1FA6

