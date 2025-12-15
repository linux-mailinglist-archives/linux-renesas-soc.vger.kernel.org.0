Return-Path: <linux-renesas-soc+bounces-25783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E38C5CBF9A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 20:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5496C30012CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 19:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACEA33D6D6;
	Mon, 15 Dec 2025 19:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxK6s/b1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA5533D6CC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 19:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765827903; cv=none; b=ElMNztJR75w9B7k8Qu60eii1y3l6k6k0myoDKakPytwMGrA5nIfRnz/2xapGGdJbfV/oO61uX6KGpEsvvskau7lEmwigH/gT3Pw12TBbXl3Ltv7+EMP85wv5qJMcAePmQM2tQym0WPGIzaTD0BMIpYxsvnyHINFnwfg8rqXlUHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765827903; c=relaxed/simple;
	bh=xc3GcT+PQ18LsQ1OcGX7R5jMyEO23ItFVcVYSFHZq4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tymyJEtqSKPvV+Rq2N1uajGjQEDTNv8B5oxgNAaXqsliZTIX0v7ziRSC2J8qIHhcW5UI4+Qr+y1G25wUiYxQjeOzrDHmUyJl0d45fJ3Rsu5+Hl+enTm8NPXF+j+aTiaWLiWHG/ubepSQHYJwibUh6165DwNsXWnvnkeQZaZDSUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxK6s/b1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A69F1C2BCAF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 19:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765827902;
	bh=xc3GcT+PQ18LsQ1OcGX7R5jMyEO23ItFVcVYSFHZq4k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bxK6s/b1PnNM2UUv2qJm5rFeodjvVTUcdtV8fl9bNbkk6/+25V4U8TaoeNoON6/h0
	 K8lgE8eDWHwtL9JHtTsdyHPN6iRMDgCAPkO4QgL4dIX91lOa/hWcOY2MUdWxyFNb0O
	 N/kLTqUJ2Y1Repp4dFtjmOsolaR8op0xI00pJICYymBdeY89hlSBA7S/pQ9LgwJidf
	 p4p3gJrgc/Yabid0NF5YMQ8kr8ujlzvPyk6FiZHohyQZY1NC0TazLLqUs27ic7VzbX
	 mmo+9zdJmWslHiQ8ri207o5Nm5/0JRvMyoRUGYOyTcJrJzk71pR7gdmPiFFMMSE3JI
	 poZJZoMeBLDIQ==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-644f90587e5so6579146a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 11:45:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVFqRw2rGcqagnZc4Ble50V8kYNErtLQceeO6ue91EBtvUCCnQ9sc7BZOTYW6GUt7gCImEMH7ruA27J0eBcFTPZCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhYviTR5Gs3kfnFzaKStJnvLwx/x0cK7Um46pzXqz/87UTurOX
	5EgldE/36ymevBflsxZdPFz6MCm2dB84mNHLdpOJHqwxZ7sI2ZKbTHOqB7+TdBBV7SU7spSoNYN
	7ZgoKVxYG343LNLz6kqHwc66mA9pyKw==
X-Google-Smtp-Source: AGHT+IEIfJf/s7hQW9itNBnOqTlcKVKlr/bdvIFI5+v8oqZsGVoSjfGGh6fgKVJZk2NQ0IxTWjWw4V6NSs9uxX9bxEA=
X-Received: by 2002:a05:6402:2110:b0:641:1d64:8dce with SMTP id
 4fb4d7f45d1cf-6499b1b8905mr13109808a12.17.1765827901187; Mon, 15 Dec 2025
 11:45:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251212203226.458694-2-robh@kernel.org> <c2mvshcq36eyigsmo5cbwlpk5usfsog7knrd5djwahz2s7crmb@hpen3pruobgz>
 <6940642c.5d0a0220.f68ee.f1c7@mx.google.com>
In-Reply-To: <6940642c.5d0a0220.f68ee.f1c7@mx.google.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 15 Dec 2025 13:44:49 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+MRx1NryyfRZiU9T-Ok8L5zyYs8+4GSuGukoSN7F=cww@mail.gmail.com>
X-Gm-Features: AQt7F2pbteaBVPereTEFzMBh0j-mZ0bM2EpUHTtr5GZvByGSUfLTBcJZkfhbQas
Message-ID: <CAL_Jsq+MRx1NryyfRZiU9T-Ok8L5zyYs8+4GSuGukoSN7F=cww@mail.gmail.com>
Subject: Re: [PATCH] arm/arm64: dts: qcom: Drop unused .dtsi
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 1:40=E2=80=AFPM Christian Marangi <ansuelsmth@gmail=
.com> wrote:
>
> On Sat, Dec 13, 2025 at 06:04:56AM +0200, Dmitry Baryshkov wrote:
> > On Fri, Dec 12, 2025 at 02:32:08PM -0600, Rob Herring (Arm) wrote:
> > > These .dtsi files are not included anywhere in the tree and can't be
> > > tested.
> >
> > I'd say, either this, or we should get device trees, using these files.
> >
> > Christian?
> >
>
> Yes I can port some dts that makes use of these. The can run linux.
>
> Thanks for pointing this. Would be enough to prevent having to drop
> the dtsi?

Yes.

Rob

