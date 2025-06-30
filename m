Return-Path: <linux-renesas-soc+bounces-18934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F370AEE7FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 22:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFFEC17F439
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 20:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF21200112;
	Mon, 30 Jun 2025 20:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnZgZiNP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C101B87F0;
	Mon, 30 Jun 2025 20:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751314260; cv=none; b=PJpkRGSCAGuFe+5DMpDC0kdhvb3qEfnEIaDHMk2ONlXO30htN5tfgqzncAFW4ILaSkxSdm9+ujGlJW/Pq6moimacpkqKXsyfCXxhQvYIgXK6LgwdW8wY11RDJMxJyWQ9I9uuuGAgAAXPU3s0Eb5Tnkdgqq112Bq+5PeJcqf8+6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751314260; c=relaxed/simple;
	bh=yhFt9C4/HWhJgEmiXzNHYKBE/qAIikHTfy83i2VeCaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MSVz7CbiSJSJNNARkkMyogxnotiDXJwYiR5jDHiGqc3gCfUkb+Wyy5SpppYdz5fl6fWYhfisyxE4U6SdvhP3Ry345xGdc9yinGMPhi7id/+UDqfwfMJ7z0ekQbPpSyZxQIKvmtG5+8ILDL2qCGzf+cWY0XygI0P5N6HunLA4ev8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnZgZiNP; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ab112dea41so1302874f8f.1;
        Mon, 30 Jun 2025 13:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751314257; x=1751919057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3W0Ky720OF30Y9mY1hW8x6gZXokd5/JnIacz604JznY=;
        b=TnZgZiNPn1sU3cPL4YJ3rctz/P1q0OGd5F9JUl+nuDtkdSzH1X79apBROgR8kXJ874
         HDCSJLVzA47ExFfJ1+MxMF856iCcBdX2kmUdinmPEauZDQy+qAAPQzqKf6V0XkPmfXDF
         wAiNPTRCd6oGupBr9yKSNoovV8geVZtkgGE617EXLhkX0LowWND3hzgDGxV50reNytAL
         JWdLRpBleiAC1jwqg+arTVC2lFL4PvcaK5lIsTEMjv5XrLS1PNKL+tg3IjISZm40iQ3o
         ppU0HVZDZBVjEEGhdvNI0nLNpErnehO/3FG1MKYQ9nAxJ/HAiKDev2uxVLfStrH2Wxhf
         D8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751314257; x=1751919057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3W0Ky720OF30Y9mY1hW8x6gZXokd5/JnIacz604JznY=;
        b=Axkh4x3rMBXAX3xmOCnYbhkiXC73N3CT/rvB+6KhSbBaYhEJbcQ4rPb8m59nUEDppu
         AqYF4ghGFJud06L5uVeIChw4ZFvtjOXYGCN1JMWh/DV8YV0oFddGm51j8AnGHqBUMDo1
         RuZg0xOCaGMKgpPThUhd9heP9jA/mHgMPFh4Hl2/VoXYANnnTF7OJVfGez+sj9lotVd5
         85MYQWUScnIvNrB/G2DTPg/4Ao+LNC7I0KFeEr10PncMWSNMUcsrUsVbNcvfPZc9/lMr
         mdlgyutpWSMzCLHrpaPPC/C/8CfquR0GSGkia78O7IEAMqKB5oFGJ3skFBPAOMppDPvH
         rqsg==
X-Forwarded-Encrypted: i=1; AJvYcCUGc7DuMbr+wrTa1TZ74EGeJI5fAwvGKRXchVuKWguaVCamHaYYbqwdM+vHKmguHnzrbVCnXkH1fTnQ4fWhQRv3Z8Q=@vger.kernel.org, AJvYcCVr7BD6eYVAlWupO9oG5RiPPqYjZWjRKH+7LtijOrofNfhhSXXnsWRrp2q6aDdfbTjwdL17lcLDTND339Vn@vger.kernel.org, AJvYcCWX8hpEW/0PZHu6/FQ3bEKi4sO+o9F1arfI+Ue3jV1QF70wcmG4b2RFnrAeAxobCAn+c41ygAcWtriL@vger.kernel.org, AJvYcCWtcGIqFJMEAn+HDKSWQUaDeAwl9KivJ30H4yC/UjfHqbtdKw6k1auOJ7y1z8OzeEv/kfUxUINWarZzoDg2@vger.kernel.org
X-Gm-Message-State: AOJu0YyyAGl3JvhCJzOAsvSd5+ISdijB6go6vd7XtvfRAtEKW7P89PSk
	J4SgnXlIYm6NNA8ZkrvwL+LdvyTPRCPa3c9ycuCTqbt3/JlzP2cjRn3ZLvV7m5cHNyvpTTl8n3u
	vpXdVhPDpzJoDqYg6J0hiEf/CsaxVkaM=
X-Gm-Gg: ASbGncukx0X7PVZrqyhOKXlVyHPLiUtgwj21cH6Qtw6NctPS9AcxpYBpCyGOJ9rZ0LW
	EmQRmRzWNRYdF9LOXe9GV/YW0dOEdVckgI56ORMaAcx6JpQ0NCFwQAghKLEjSxVROOup80lTXPA
	xIg5f42iDxUUIDjb+HWQDGMFJsTGMvs9/jxivxtPTxc/mogepWKcUpRWE=
X-Google-Smtp-Source: AGHT+IGRG33WAnxGN+1G5HS/DTkroLC8p/9A3FM+ii+Ln7Jd92MV6lwBLlaoZyor9D4nLUln7cjf1f7H66Pd5sDgM9c=
X-Received: by 2002:adf:cc06:0:b0:3a4:cfbf:51a0 with SMTP id
 ffacd0b85a97d-3a8fe4bc8d8mr8441908f8f.21.1751314257165; Mon, 30 Jun 2025
 13:10:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628115715.102338-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250628115715.102338-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <2025062914-unkempt-reentry-470c@gregkh>
In-Reply-To: <2025062914-unkempt-reentry-470c@gregkh>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Jun 2025 21:10:30 +0100
X-Gm-Features: Ac12FXyroSgnjem2B601k4jsLv9ZJn6DY_UrgZ0NPsjorcqo9ddA4RB8qLJk0Dk
Message-ID: <CA+V-a8uNoyFUDiq8+_-tY7Kx12R++bkYWdLxP3cmKZ4z9rpBdA@mail.gmail.com>
Subject: Re: [PATCH v13 5/5] serial: sh-sci: Add support for RZ/T2H SCI
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Thank you for the review.

On Sun, Jun 29, 2025 at 1:28=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Jun 28, 2025 at 12:57:15PM +0100, Prabhakar wrote:
> > +EXPORT_SYMBOL(sci_port_enable);
>
> EXPORT_SYMBOL_GPL() perhaps?  (sorry, I have to ask).
>
I agree EXPORT_SYMBOL_GPL() should have been used as module license is GPL.

> Also, why not limit this to just this one other driver that you want to
> use it with the proper namespace usage instead?
>
Good point, I will switch to using namespaces.

Cheers,
Prabhakar

