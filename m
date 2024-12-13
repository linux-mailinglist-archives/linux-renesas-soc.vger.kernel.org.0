Return-Path: <linux-renesas-soc+bounces-11276-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D33C9F05FD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 09:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A37E91883513
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 08:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67698192D7B;
	Fri, 13 Dec 2024 08:06:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from arara2.ipen.br (arara2.ipen.br [200.136.52.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE85618DF7C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Dec 2024 08:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=200.136.52.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734077166; cv=none; b=fhKvZ71jFg8uJEHvxDiehGK3xzl7WcFKyTDJXfr5UL/YQXCBbZ1xgZEsY02bPBcHJonjEN8RLghXRU/NNTly0CD7VmPONMZWmASCXwgEGIJzqZ0o8R0B3MHJTU6cAATDLU8iUrUEcmyEVMW6csgqa0vp6g3ocnybsc0FjQG7sgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734077166; c=relaxed/simple;
	bh=Cgr97JBiSX1QIcd2ZZZsKVChGTY1ZlWJ/4AhaVFA7Wc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ebVYXkEWrhX3lpD88jW4xqZQduFi9TjNr7kHA7csgut0fNFs8Hkvo6Ad8gIDrsUX5xVjuJo4ahRvyPE6JSwACOQBVujKjohI7p7uFRDA9kFQpKc/DeqqQNil0TZhOOclozgoQU0cw5Q4gh7Y7bFHYMGfivqRELglCx70qGsImnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ipen.br; spf=pass smtp.mailfrom=ipen.br; arc=none smtp.client-ip=200.136.52.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ipen.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ipen.br
X-ASG-Debug-ID: 1734077111-055fc729eb1497640006-W7S1xt
Received: from arara.ipen.br (webmail.ip.ipen.br [10.0.10.11]) by arara2.ipen.br with ESMTP id 6YgWqq0MnLrn19Gx for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Dec 2024 05:05:51 -0300 (BRT)
X-Barracuda-Envelope-From: TCWM178776@ipen.br
X-Barracuda-RBL-Trusted-Forwarder: 10.0.10.11
Received: from ipen.br (unknown [102.129.145.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by arara.ipen.br (Postfix) with ESMTPSA id AC32CFBE443
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Dec 2024 01:24:46 -0300 (-03)
Reply-To: t.mazowieckie@mazowieckie.org
X-Barracuda-Effective-Source-IP: UNKNOWN[102.129.145.191]
X-Barracuda-Apparent-Source-IP: 102.129.145.191
X-Barracuda-RBL-IP: 102.129.145.191
From: <TCWM178776@ipen.br>
To: linux-renesas-soc@vger.kernel.org
Subject:  I urge you to understand my viewpoint accurately.
Date: 13 Dec 2024 12:24:46 +0800
X-ASG-Orig-Subj: I urge you to understand my viewpoint accurately.
Message-ID: <20241213122445.1EF6CCC7C60B5539@ipen.br>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Barracuda-Connect: webmail.ip.ipen.br[10.0.10.11]
X-Barracuda-Start-Time: 1734077151
X-Barracuda-URL: https://10.40.40.18:443/cgi-mod/mark.cgi
X-Barracuda-Scan-Msg-Size: 512
X-Virus-Scanned: by bsmtpd at ipen.br
X-Barracuda-BRTS-Status: 1
X-Barracuda-BRTS-Evidence: 34fbb5788938ad5710ad28835fd12206-499-txt
X-Barracuda-Spam-Score: 1.09
X-Barracuda-Spam-Status: No, SCORE=1.09 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=DATE_IN_PAST_03_06, DATE_IN_PAST_03_06_2, NO_REAL_NAME
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.45577
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------
	0.00 NO_REAL_NAME           From: does not include a real name
	0.01 DATE_IN_PAST_03_06     Date: is 3 to 6 hours before Received: date
	1.08 DATE_IN_PAST_03_06_2   DATE_IN_PAST_03_06_2

I am Tomasz Chmielewski, a Portfolio Manager and Chartered=20
Financial Analyst affiliated with Iwoca Poland Sp. Z OO in=20
Poland. I have the privilege of working with distinguished=20
investors who are eager to support your company's current=20
initiatives, thereby broadening their investment portfolios. If=20
this proposal aligns with your interests, I invite you to=20
respond, and I will gladly share more information to assist you.

=20
Yours sincerely,=20
Tomasz Chmielewski Warsaw, Mazowieckie,
=20
Poland.

