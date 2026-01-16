Return-Path: <linux-renesas-soc+bounces-26898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B58D29967
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 02:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C20A93015161
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 01:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22804328B76;
	Fri, 16 Jan 2026 01:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G/oOI5xT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="B9C4LkeT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02CE32720C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 01:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768526604; cv=none; b=sASdS7LyC7qWtENrKTRKzdSG4Q/P1rqmx/ViIv6A0Xx3PIcMVlQkd4PS7JDKXtIMuFUXmRPKeRSuf/YI7t1/lSskMetXlg+hr9s8vJtFS12ybLNLfJr8QmYbVBzzqo3YlJ8ZyNb5duiYD7NpL+DhVozhay2j1v6ckjlVPjUC8jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768526604; c=relaxed/simple;
	bh=R4xvYuUEoszUJEy7wrMslCnAbmam4wC/SnRLPqb7JyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/6TKxfxWjmDRLYZppvjeHQBxJn3PTKSNDg80OuLn69P8U+4FjJwAe71gEQto5zmHCKaAIea9XalJSXNZwcTCsdkBgEyHcHVWjFMP9xjjeruPq+OQWrj3ALqMClER9MvRRsrTDCNcfjPj+Kr2nTfSLPhzdd92smPMiFj8IRrKgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G/oOI5xT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=B9C4LkeT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768526593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sNCU18zVmIawu4LQkxTSRVBM2Dsz2DQMMKhUjFF4BXM=;
	b=G/oOI5xTnWfOhC2roHhLG4+kJeszC6DkTE+2KRY9SVvJ7b7XpV8DeD7tYdaufm9vz/u89n
	njYy2jsyb8irzKGnSkbHe47IJmrvMUw896ZDvwuVKyzci0CNBiBN8i7kMmMQ8C5+3Ne+1x
	HPADrCBeQG+77ArVlSF6C0M27xHtGW8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-kwEAAjuuOk2HMSxazGO63g-1; Thu, 15 Jan 2026 20:23:11 -0500
X-MC-Unique: kwEAAjuuOk2HMSxazGO63g-1
X-Mimecast-MFC-AGG-ID: kwEAAjuuOk2HMSxazGO63g_1768526591
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50145222233so41432971cf.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 17:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768526591; x=1769131391; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNCU18zVmIawu4LQkxTSRVBM2Dsz2DQMMKhUjFF4BXM=;
        b=B9C4LkeTHsv6krppEts3kxQ7DOvbW302fk1rzwHmFZhQAMna//OdlT2g+7F+atHH0X
         3N6ag2ylH6+JEz+Jeq2mK09KazrPg1gi6xdVM4CRSx1NnggEjbGZkQO2T+vapMWwukIJ
         qxepEwexEqeKJli/qdrS2FzSZn9xyNSSbZAFij1T+wS7rCYXa1huJdBm2/qiT6O72pD/
         aOFDPA350R+Wnmjipgj+QFSlSBKqHCpXkxaVgg5YAtBBdX5bsfCin/i5kgzAtqSBU4tv
         kEq2PDC3pHTB2IA5b/eNj79mFAYBWJMlb5t/aypWj9b+7/ugSee+6FGT046O4hW1Gtjy
         tRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526591; x=1769131391;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sNCU18zVmIawu4LQkxTSRVBM2Dsz2DQMMKhUjFF4BXM=;
        b=euzshLe2n0cx8x8eFjz/9BfhbkafYo15ry5D0QgKjzl23jHZLznyNg97jKiem2l0z+
         S8QbFPlDkPOATvhKpRpbEvAPBNWEBnruxgF//3WQF51k1/gnTmfwsjuvQ/3Um8a5I99s
         mH0TTRSjJ2fOlkZ8qbF3RBnAVSqFN3fcDmg5S2r+YvGStap3lKNp5Mb09HGRJF9iwLjN
         7R43wPFEuuo7E8N5/fFoBo4T8kHSws/6VVGktRnG4/yNdhuBT063wAWT9C5a7vVnGGGP
         RChZbzc8E7RgcNzHtWuZEgCCx9nKpGzHUkmHrSe/Ej6CUI8rOxJ6HPYDpuP30czl4+6d
         vDZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9eZDJ0x/PDNmJ3rzQ6gNgvTcmup+OrNGCpdDFQ7o1/5OqT6hTAPnE3OX/+ZdjWZgP4LC+ea1iQm/b1Sc84iMCuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjadBOlOjTJYUG6H1ATy+q6V9HK1f+rx/CSN13ODQjhlzw/ofS
	lJZDqXyUXz76bl+XBwmvTeV0atRZ3vgXbcH5+iSqBFxpMd4NVh3NqnSDTf9KjweP/2m0k0V2pep
	5L+0oSrXDcR4RjvR2Z9fVnMhUx5FZLsOL/r0wk7NR5GzTXqW2oOExKJA7aT0kR/Fgz+PNC2Zz
X-Gm-Gg: AY/fxX5A4hC+mf2ItWaU+yhmfY0koeML13jgaY1/Wr82AwU3JZv/2t4mTFlgi7QdB1n
	/ghSm5JjdunALvqIj4H0StmMl+lr9Fpqoeb4VED0Ve3hTHbbdpbncKPxDhM1VaKiecFR50WM6rt
	hRNVErGGJkQlXp+uaI6psn965757w7Se5Dur8yLREaFxpR75wZ2yMNsR5CvXijWNyn50LhbHYt/
	F/W+OBAEixxE7rGfLvA2cMCi+X2bVb7BUxD/NqpAxEWcxPdJmUumBMGvuyB1fk2Ur0IcEP2I3QF
	MFZFVaPvfkXntQeHXRNg3FVt+6d4UC9g9OZrgBR3M5jK3RF4/dbsJ6ZCV+t5mUD55rTpmvUR80H
	3t3BAscVBUdZKYDSg3phB9csAdDKkxRmw0WxFzS9orb+J
X-Received: by 2002:a05:622a:58e:b0:4ee:43b0:b053 with SMTP id d75a77b69052e-502a1ddba73mr16020141cf.9.1768526591387;
        Thu, 15 Jan 2026 17:23:11 -0800 (PST)
X-Received: by 2002:a05:622a:58e:b0:4ee:43b0:b053 with SMTP id d75a77b69052e-502a1ddba73mr16019991cf.9.1768526591065;
        Thu, 15 Jan 2026 17:23:11 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1ed2844sm9167641cf.18.2026.01.15.17.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:23:10 -0800 (PST)
Date: Thu, 15 Jan 2026 20:23:09 -0500
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: Add missing log message terminators
Message-ID: <aWmS_bBzZO2FjIb5@redhat.com>
References: <cd0b3624066b80ed0bb00d489c99e2c1a06d755f.1768480559.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd0b3624066b80ed0bb00d489c99e2c1a06d755f.1768480559.git.geert+renesas@glider.be>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Jan 15, 2026 at 01:36:56PM +0100, Geert Uytterhoeven wrote:
> Complete printed messages should be terminated by newline characters.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


