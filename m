Return-Path: <linux-renesas-soc+bounces-21071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BADBFB3B9E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 13:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A36B46746D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 11:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D909288CA3;
	Fri, 29 Aug 2025 11:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FkNPPWmd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C0027934E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Aug 2025 11:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756466709; cv=none; b=n3ep+EptaJhgOxZx+hP0CDp3AU5uJ6/1ORdpxyngEJz18nPdjbUIBOC+CF8dywHSE9BsJppcolM/+QmMYt6EWWTq1HQW5qs8YOaKeGHs0vPdABRU0o3S/NuLFDII8IeGs58tKf3lCOB0iA7WyqpMzjGucSaLaRK21uZwqWCjoPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756466709; c=relaxed/simple;
	bh=6BFQxgM0oh5DVS5xIr9d7exSQK21yLoo9WBRstJGdHI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Us9AhOeduhzfg5z58Qg5PXPV9gcg9JXbNJtTlaijgMJyjuQ2nRjNR4gj/fkYcVUlP4RGR0lZMfQuHSJytZR0W6vn+JDA1Xi+ifL5u1Lfbr1eGKguaaIGSPlbIQGuiJ/2uhY1AnpFKJPKG9/y9uYFEedV4Z5aN9Z4wCxdMi3EUCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FkNPPWmd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756466706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=H5DSrH7S/YL0DhZrQaaJj+H/G5K8+6JE30rwyPkkkH8=;
	b=FkNPPWmdZBAryhAHtAJGGETQ6DJiUG+mBKliriIvEvdgzQtOtYA+ghg1JiOS0bZNi2+9wO
	p0H4XilmEwS+e87IWQrz2phJwHtHgk3DhtDNGKyp29+eKU6tlbKg2mntd4o5e/tj5BDw/M
	sNBWREqB8guG9ujrzkCjGMwWzwVZj2I=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-ntlTORyROvqatV3gfZbYTQ-1; Fri, 29 Aug 2025 07:25:04 -0400
X-MC-Unique: ntlTORyROvqatV3gfZbYTQ-1
X-Mimecast-MFC-AGG-ID: ntlTORyROvqatV3gfZbYTQ_1756466703
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-afcb732ec92so176174966b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Aug 2025 04:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756466703; x=1757071503;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H5DSrH7S/YL0DhZrQaaJj+H/G5K8+6JE30rwyPkkkH8=;
        b=JDMuxnOB2rXDd5kMzEP5A87Kd4UHSGyWMBzsPVu59bKAJcd7vhqgNjKnLth598L+Hi
         ffBOt7CLwCAyWWrwr93DNu1m2ajhrpikVGZD5UZqxLsglfJXjMfhgn4fsoLsAuv0DExJ
         AU+Fcx4zItDAtlQ1lAUqUyAHftQhappuXckz/ohzxr7io/Sf5T46wyY4KI9SGar6THb0
         rF3rc7j2b2lMPSj+aHmrdD10LZ/kYZhIQz6hKd1ph9N2JtixMs5c0qeGd1qfL+LpEENp
         spiVNe3Pq8YaDri1b9XLBCqfu/NxNkJPwchF1QmpqMRoSjwgfe8gi2i+rFY8FJ9Mt+bj
         b8/w==
X-Forwarded-Encrypted: i=1; AJvYcCVrGEpbHzVihSxb2lRSeJuHqIpZs9L0NRYh9cX6thwViar13RdI1fmkn0TLHNH1Sl7OHXKXt7Kt4+0fp9qySNDfTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxC/BK6GWtT11+rzDNMwK+TBB5eYsSbFmM+rIQS/vmyGoxrqBz
	UCnKCqu5U75VLb2BBIpgNynZtiri39HSyDoOe/QP8uIMOuEgDi7TzFQo7VoLAHcm8ysrrlmCELY
	OKnNmfK4BcahhUIjyFDlxxJoUchLwieoZNqR3MwXUreTdtXrPYQtGxGoWf+aDqXKda0An6QlNeY
	Z/6+0U4I9JJApgOhEduxCCzLYZ91vUD7/lJHtKKa18i4FaRYk=
X-Gm-Gg: ASbGncsWARpkrl3mY9h18g3cmoolXBk1TFyhYDmCvg9d65SIn80RKqsEnTspJ8FQ2Z/
	dV22A6MqRhvIC90RCRP2AxLiIEHw6UXFKqYVoXvtRwj1CBZqEUKI/Ao27j7Exc8Q8bL1e9DEJ9/
	Iz34jVdI8LTrw+A13qlwNs7NqhLcz517/hSSeI5c8NXvR6TyDYInP+
X-Received: by 2002:a17:907:7248:b0:afe:839e:d10 with SMTP id a640c23a62f3a-afe839e3cecmr1780883166b.31.1756466703352;
        Fri, 29 Aug 2025 04:25:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDUAydazSnnhFhQ2IS/7xxn5zNZxC7KkqkPr1qBMJMM9fvjQWnwmefjaIofovb26bMZHJC4dwIv5EeZ0pSjP0=
X-Received: by 2002:a17:907:7248:b0:afe:839e:d10 with SMTP id
 a640c23a62f3a-afe839e3cecmr1780881266b.31.1756466702991; Fri, 29 Aug 2025
 04:25:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 29 Aug 2025 07:24:51 -0400
X-Gm-Features: Ac12FXyyk3VCSqAncN0P6PmazJ4uiOf2K-91_nf2hLatGLxa_FrGw2-c_4CbC0k
Message-ID: <CABx5tqJ0+1bjoMM4qPS94coa0wyQaae1gJP14pUKk+xVgD5kaQ@mail.gmail.com>
Subject: Bouncing email for Renesas Versaclock 7 Clock Driver maintainer
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

The MAINTAINERS file has the following entry and Alex's email address bounces.

RENESAS VERSACLOCK 7 CLOCK DRIVER
M:     Alex Helms <alexander.helms.jy@renesas.com>
S:     Maintained
F:     Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
F:     drivers/clk/clk-versaclock7.c

Should this driver, along with clk-versaclock3.c and clk-versaclock5.c
be moved under the drivers/clk/renesas/ directory?

If not, is there anyone else from Renesas that should be listed as a
maintainer instead?

Thanks,
Brian


