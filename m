Return-Path: <linux-renesas-soc+bounces-11261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 951219EEC0F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 16:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB020188419D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 15:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C0D2153DF;
	Thu, 12 Dec 2024 15:28:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AF9748A;
	Thu, 12 Dec 2024 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017324; cv=none; b=TXhYa3X3CNTMJrRu7Kd2UDfbOJukZ5F24O2WhNZpQ2p6BLla3qUfAMEn/2oLt7q5EPm2Irw5GnGDbLV6gv8CWDABD9mRDaxGJjIEfhN8SHO1Gk72P6PBRQ3z/+cS4bu+zKW232KoodiKuB5ZZgS5DRaTaVtAkmrckqcXJcQyA9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017324; c=relaxed/simple;
	bh=9UC91LiEWwKwD7btYmp3btZvs2Pbldwk/D5aWaye7Jg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yzf/XOnMKncU+ragj9ZBBLBxcmQjf1vvvVYPJNAci4Q31XSLjwO8Qhq7OsvOvwPYpu7prq/9sdlANwqNQ8XoZglh3Ns03TFHPziR88ls7g4VEr+C0LBFBCMFfCnNIfTZtDbukCVBVxaiMioh4kEnjl7x/ZTN0w7UMgxZ73sNMg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46792996074so8092981cf.0;
        Thu, 12 Dec 2024 07:28:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017320; x=1734622120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxuGAdXrjp5p+uTzVhhPXcUl+1JpJ/TKwydBIGwpmiE=;
        b=Nqtlmg+IpI0rFMbYtJJnDpC6NixUg9gnB3fV9OoR0sMKF4Q9KgcutF6H4B9PMK3fqq
         CMcfZP8BAtTW3lIPWfCEQhXdOyC+nD4hYqEOHkTMB4a3GoNxpuPY+nlTsoc/4pG7T8KS
         XIvRVT+LSsR7UEfzZ9quFb/ufQO1axl56O4adgkmDw9tK+5strsRrJetIFL1wT6S9XER
         RZp+xaU23C192dKAqycRd8coEJpx4qEB1Ak2+BfVg1VxJF3W07pOGuXx4mFPEpSPZt57
         2PwWweFeEwwSJxKRAEi+p0nQshbMcwgJQhPapUJEtvhLBmlWgHfxR3ENgojWdLeBZwuV
         Yl2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4HQcuat6KnPtIiZTlEBOVYAusxiyVjBvtGEknY7eNW7CCzT8mW0/NJKM+pjjMEwOtorXlXL5AlxtN@vger.kernel.org, AJvYcCW4asZj3Ke2LXMQZBb5p++VIwd2hn8TzfM/+HYSbGgmQkwVkMPRyqSqb5EhrdNyXhIjeRuC3k4wqY4C3D6gfCjTlHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFQO9VuNBlkgCeFFFMhPan4PC3xlHfrpqxrFfFiRp0PVLE9kP5
	RggEV6EqtZ5ONyaU3MsshZzzI01HSsblsqDJgVsPEpshYgBO9jqaT/jgBd4lV5c=
X-Gm-Gg: ASbGncuUEcb30hBg+KPdd7CmVZiNmciSRga0o7NN0U5LlV33S3qipZrzo3EkuObPfDV
	QjmEtndH6S7+MtmQSYAbNSmY9zKedGyd0rO/jngWCp59VK03nAMB2m9UEvOervr63SRwEJM1rdc
	YabeF6KFR+JOHRAL7+WNF8o6AdUkAdcARyTPo7ofzSEPn0YhEz25HRkzJgVrQcyi1yojX6qxH1+
	yrggIlAwudEYdBfwKcMJloHM+AbXNl9iG7qEZtVO+11e3OgGObHPtb+stlW2H8K+YAF+TiMj0EI
	5NyRoG80nCv8LXLJ8RXBIS4=
X-Google-Smtp-Source: AGHT+IFeq2vt2LMM9dez373iJYlkG6WeD6qmmsLb6b9HoFG46txUC9ddxhM4B8heavnSQGJauoqC1A==
X-Received: by 2002:a05:622a:1114:b0:467:7a27:f3bb with SMTP id d75a77b69052e-467a16f719dmr9870631cf.49.1734017319988;
        Thu, 12 Dec 2024 07:28:39 -0800 (PST)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46786576bc1sm24316691cf.17.2024.12.12.07.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:28:39 -0800 (PST)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b6e24aa0dbso55044885a.1;
        Thu, 12 Dec 2024 07:28:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcRb7EDigBWhOFUrMxGKfTJjY0KlhfhLp/bukieCCok40tfjiEaHspreKNl6T8de45z9OOnnUSIsGLeD2PUPg78pA=@vger.kernel.org, AJvYcCVaWRXymJj5d50rBgl8w5jmc4jURAWfGZ9olcdAOWMQkQ5MTduSkpYY0NrtVo6C7R1d7t4/bMR3fHjF@vger.kernel.org
X-Received: by 2002:a05:620a:2496:b0:7b1:48ff:6b62 with SMTP id
 af79cd13be357-7b6f88fe9a1mr96312585a.16.1734017319538; Thu, 12 Dec 2024
 07:28:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com> <20241203105005.103927-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241203105005.103927-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Dec 2024 16:28:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdpX6dFp6bqtewq0v++=RtdiADMK7b=ryDownpkz-sHg@mail.gmail.com>
Message-ID: <CAMuHMdVdpX6dFp6bqtewq0v++=RtdiADMK7b=ryDownpkz-sHg@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] dt-bindings: soc: renesas: Document RZ/G3E SMARC
 SoM and Carrier-II EVK
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 11:50=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Document the Renesas RZ/G3E SMARC Carrier-II EVK board which is based
> on the Renesas RZ/G3E SMARC SoM. The RZ/G3E SMARC Carrier-II EVK
> consists of an RZ/G3E SoM module and a SMARC Carrier-II carrier board.
> The SoM module sits on top of the carrier board.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a shared renesas-r9a09g047-dt-binding-defs branch.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

