Return-Path: <linux-renesas-soc+bounces-22718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 234D5BBE840
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 17:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C06B4EA4B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 15:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB79273FD;
	Mon,  6 Oct 2025 15:40:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D692635962
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759765256; cv=none; b=d15kIN4I744nPAejK+gT2APtlYYrEa4aP6S69/h7eivCIsz0ND4z7rhftojpSGt7P177lw2v+9AZCJdLUdnYKXUxNh09FnYE16KGnQKelsWcqoETVvOMRCaPyfEtbx6rN9Z/o3+9P/mkA89HtnbmxQ6CCyJlf9Hk+2BZOMQkFM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759765256; c=relaxed/simple;
	bh=dSnfb3yL4QKj2jW1vkztCLpaRi4oy5M2m+qzcux2G/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Px3Pvq/MKYsquexcV9eb3v0M5WvGbYhha9qwrA/oC5NjtodBaJghPf8QAE4a7lym7g37y3WjD6E6OQmuZll7l1kmxLTaDJA18Evc0TTjsAaCuh+hbH9Q3ChndmO2Leqs1G4i7mIanpA304Wj487K0KXOE3+0igkljq6vNuWdN/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-8e3239afdf2so3223371241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759765253; x=1760370053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jg3+SSfQDF+38T7p3MLG0Dd2g8S6PQVTqm3cXu4YzM=;
        b=Jua6JR7Q7ZoXvwGl5G/++t715s0TUt8v/rqpHgVhTcIZGBLJZtDRBFbyKBGXL3Z2In
         uz4AiQbjVPRB0DvWDTX7+f1WCvuKycT+D0B4FhWHU7rSfIN6/kCPqzpD92nafoqXpG5I
         6xs/uw9a0GvAavwWBjD9EwFao9zdmwHQnyCW9Mva/nPbtiOnxC5p+rJAPepyarzhJX7Z
         SzG9UcTpuQbI8JlUvG/yuRQs/k7Jqxi/uot6KMUAnq9BHMxEHFTV+IS0ORudWl+ylhfi
         AYW6FrJC4lOzZLakyX6/Dd6y9vcn13rJXtusBvJWdgEhpM1xba03jvXohTsugG3hv02L
         yUgA==
X-Gm-Message-State: AOJu0YzsurmfQClW3HvgL61Cojn6ZaXlbU9aEKdvbY3Ztpl1c09Mpduv
	YLbAQi/un1XjVHyrTumVeUABMMEukUJupr7X5LerilWX6NwErme0q1omvcXBpiKA
X-Gm-Gg: ASbGncv9ZRh/7C2N78lW3zwMBoz8/J2DN1NvUUxMTiC9pOf9dEc1wR1cZRBonv7/jli
	tC9FH8J4SevsHj/nU91hpYgIIf2jwY+lLzicdyIOR+pKCTLy6QgwF9w+4w7v0coN3mFWr2e5IDM
	j51rVk7WTEN1EEIPTwX/kBUlF9rDgbcxm7707wsFiQ5lQXz7fg1FhUYQN21umqpmgbzfOWYmkiO
	rPMf1GwIk9Dzu4F6uAMgxMjY7I3XIke3puhsYFaJ9MjknU7XJ3fhft9gVDNIixSe4i8BfkUUcL+
	pA1sABY24mXbyAdPz9aDnoGLWQGon8ZoyiMF6krjsvj+ScPB4hGEV3S3Ugsx0eng9+JWss7gyea
	tzMzfzv9xLkYJOzcPbrW0DWolibXK7Ho+ChlSmyHr8oBYzmgyOXvzYs/k0JA+v40BQRuX8/FwkC
	sm6Jo6wVlM+DReL/0RhLlWlD4=
X-Google-Smtp-Source: AGHT+IHYSkErM7CJ3DCpFlqdavRepxFtfYC2NFSb9CaiB8umsshvyTeavJ1NY0NqFleFVBIcTKqw6Q==
X-Received: by 2002:a05:6102:3751:b0:5d3:fecf:d587 with SMTP id ada2fe7eead31-5d41cfdb823mr4992721137.8.1759765253519;
        Mon, 06 Oct 2025 08:40:53 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-92ec0c1dec7sm2367170241.18.2025.10.06.08.40.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 08:40:52 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-54bd3158f7bso3863785e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:40:52 -0700 (PDT)
X-Received: by 2002:a05:6122:a12:b0:54a:9433:2aa9 with SMTP id
 71dfb90a1353d-5524e84454fmr4377149e0c.2.1759765252536; Mon, 06 Oct 2025
 08:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006082520.10570-11-wsa+renesas@sang-engineering.com> <20251006082520.10570-19-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251006082520.10570-19-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 17:40:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXpFwHG9S4GxgxiL1Ko1C1rOaJvwF7xfZuW1iebtXisqA@mail.gmail.com>
X-Gm-Features: AS18NWDaUb8AOYs4DT3elfKKXvYE7OVBQf-2MkbfS-R2J9UIcx8cNKS7mb_zZb4
Message-ID: <CAMuHMdXpFwHG9S4GxgxiL1Ko1C1rOaJvwF7xfZuW1iebtXisqA@mail.gmail.com>
Subject: Re: [PATCH 8/9] arm64: dts: renesas: r8a779h0: add SWDT node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Oct 2025 at 10:29, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

