Return-Path: <linux-renesas-soc+bounces-17868-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3508EACECE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 11:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBDB27A9827
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 09:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BC220E31C;
	Thu,  5 Jun 2025 09:36:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00DD20E00B;
	Thu,  5 Jun 2025 09:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749116166; cv=none; b=RH+Nr5ptJBlDf89EAqCKKEaZI2sXzjcxH0tCQ+tI6ARQtbWpyTmcSUUSaoYkoYQ/vmMn4Onmf8h7E5Q/qhzdJGNnz8KGhm8uXKAYaVXRtwhmJcHDUcBzI3a2a7FcaEVKIY0pLRoYumTkIBuXj9W1FtT56sBPsPp0BPpnlqEDM04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749116166; c=relaxed/simple;
	bh=JrQvz4t1g5IhXKki5JGEGJEsUC+3QbNZwDeswnHQuD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ul2ntWq7lyTeYICa6mRsdRD9BovLHfUmLiTGlggIDlF6bjvpSY54h2rwn3gzosPBcJyYSWVYQqMCTqhlzb2E2gTwAdMGUWMTSDw8mUsgj/vtnlpc/0OKiFE+nQU9a3DFvzAcU9JheUiyUOLh2BzOHB2/ElJwfwXpfp7F1RH2hPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-52eec54acf4so258402e0c.0;
        Thu, 05 Jun 2025 02:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749116163; x=1749720963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wuDHQj9OQFNcab/MMko+ZtyjFUuUo9apb1ZE7z2sFI=;
        b=e9vPvcPvjVpYxybLEJjV7xPFjWfnWXTvhJ5SIaUY8Ai0/kaX6GST2krUk+xRyiQdrc
         bflegpA3nGOzoj6Thm8dX45tSxWJa6m6Tb6fPtmIzLRUSHsZU2JKdVl646WZZrwm3a3e
         j0kyV6XYcJLO2yEmYsyy7z+3MW+fSpiYkWPkTaPzXlmNokVZCDhKY0o1jWEAirNfN/F5
         TJS/JSTzwJSkzvfOibIrAw63iYyk5mFZ7/0q2Hl2cvSi4svfkletHKLuXvKHgnBaDj6Z
         To6jAZs+/gumr/fEK3mBQa92YC1lq+XFj94EDjf7Yjcnt3x8ZrN4YjX3OLlrAgBqBIs2
         QLSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKkDuMIilfYs4jbqsk0ruriNh8DhK/8IiVP7Y71BaxNURo2vYEAa8yNoaDHxtq42qZgh4LAWcHpXcD@vger.kernel.org, AJvYcCWPtZ7eX2ERpw6xl1eNGUx5wUHcf2ZhmRWSb0oYDYW/DbOHvxVa8+2Bdhjo3SdXCc9nK7RUmytpHQlFJi6iA5dKxY4=@vger.kernel.org, AJvYcCXA9Y5zt8Bxhzo9c5dhjFIY9hA1EyTXMXsB5tNVEWVp0hnjLoAATAMSPsUNf9lpGZQN52EeHmWkJo8g@vger.kernel.org, AJvYcCXaLRLEGsc0NBhm8OGAlGnT75rEffZLgC+FWJktQFvDK8AyMtj7Pn82Fcb8HRlWJ4ocYBg3bDckvYZjsKTw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw1rQq3eBHcUTWxVnC2UMZ+dMLie9YU78Et/ogmQY3VLaRFREm
	JVMI5h9KoTJQywqkU3ReLnf9oT/H2tuxdGbgMkEHEF2klpBc5ybaxXoy6eCPxco5Dvc=
X-Gm-Gg: ASbGncvBTvaNUnv+1AzxaNjtSRA1t8s3IukCOfrcYKMe60Gcl8T9WrJzMkdPadBRFcJ
	Mu1zgtqUVYwIyrGElfT8DnQxbKCzjPMCaev2E79lujstibZjdc/JdfNw2BW+fDI5MlP350IJRy6
	EHotUl7RkLO0dHfCnqVQARDvAKay8FcBU5Ut7qPYm9y4LR9oPfW4wIuPE8jX3JLXq+T3MHDkO0h
	knqKwq9QEWOVAGzE/KKHg13MbWLqDq471GliooLg3a2M8MYr5p7qs8VSOC8stRL+54lQzHimDTx
	5WQzKJGpJZ0jVga7mO2478KYU+7zg9P++2rW90O50X3/whvWzPOVTzv6qIQEQYNibuoKbvJfKeK
	yezyBLREw0kZy6vF1PuOcY7yk
X-Google-Smtp-Source: AGHT+IE4cvmBIOpzVdI8lpa1JTXWWYP8Ti8uDt9zvZSVHKdQ/c61EiiupJ6Od30XWPocs8EuaM0w6A==
X-Received: by 2002:a05:6122:a12:b0:52f:bef8:deff with SMTP id 71dfb90a1353d-530c7377379mr5461032e0c.8.1749116162710;
        Thu, 05 Jun 2025 02:36:02 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074aaf584sm12234459e0c.7.2025.06.05.02.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 02:36:02 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-87df839c6d3so214911241.0;
        Thu, 05 Jun 2025 02:36:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdNB9OdfPCWezDUBD5MNFTWpgAiqAEn0Vqd8yNrECceKr/m7cnN0z0Xmg+o1dQ/eQNuX0YTJ0bEUWT@vger.kernel.org, AJvYcCWGvptIkp3I+cQO4svW6oILWRZpRAe1/CsB+FbgH27q8GshN8RJ2eiE8mN92tWykHdt5cYMxYXfysJJ@vger.kernel.org, AJvYcCWRH1oDz+oRzsPvi/vrcHGY6xzhEhyh7uocKEg3cx0G17gf+1c+MHMi70dl8uKApZlVWDQw4S1m0fakaRUs@vger.kernel.org, AJvYcCWwIO7aQSRlP1A+bQs58BNNPXY45rJuQXyyJJms3wBXuudPhZzLEHa5gW4kvuWrVCX5bPORvn8FB+1E/sBUnmG/MFM=@vger.kernel.org
X-Received: by 2002:a05:6102:6e82:b0:4e7:5e6a:12f1 with SMTP id
 ada2fe7eead31-4e75e6a1788mr556415137.15.1749116162162; Thu, 05 Jun 2025
 02:36:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com> <20250527112403.1254122-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250527112403.1254122-6-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Jun 2025 11:35:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXb-81W6zVE9bJOVzRDBR51eEimXkDZJkFdCVQ_-UTV9w@mail.gmail.com>
X-Gm-Features: AX0GCFsAqb2H5xlebZWxQtDCqZNp1iUEtQo869CfvKiSg7v1YOyQS87qsvTgXkU
Message-ID: <CAMuHMdXb-81W6zVE9bJOVzRDBR51eEimXkDZJkFdCVQ_-UTV9w@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] clk: renesas: r9a08g045: Drop power domain instantiation
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 May 2025 at 13:24, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Since the configuration order between the individual MSTOP and CLKON bits
> cannot be preserved with the power domain abstraction, drop the power
> domain instantiations.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Chances in v3:
> - collected tags

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

