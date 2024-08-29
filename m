Return-Path: <linux-renesas-soc+bounces-8502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EC396475E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 15:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A67E1C22294
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 13:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22491AD3F2;
	Thu, 29 Aug 2024 13:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t7Th5bMi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F1318CC1A;
	Thu, 29 Aug 2024 13:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724939927; cv=none; b=KAitLrG0pVqBraRhvAV1jaDS7zlz6g6qcgclFsfpJP/kGQIRen6HBm5DubsaUTGDmpSdw93LcHTlWIaQCbIvIusvCSCNxSkTcagrONJW45ehRi/DhcgHSiHtXAwkdX0TFZ4eycWLYsyQET/zzcpnJsG0qSmpeqQkmt2yMpfvZEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724939927; c=relaxed/simple;
	bh=0q2Ur2MUpnxOlKHJBVHPWz/HdHJLxmDIENnY11FuYXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0CWXqlZ4rhgws0dAYCfJY2Te9/JWJUg+MJXmzXxHjEt1Lzd/1IXmb6ug/X9cq19C5DkWgfzCSfGfQNAEynPX8vXJ0jgDktgrhyS/FMucKr6DN5p7W75YN3D2tnW1OLsX6GD39tQvfhAFp9yIXe1xTg3ZwKueE1gYhQdCTxfTU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t7Th5bMi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1AFC4CEC1;
	Thu, 29 Aug 2024 13:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724939927;
	bh=0q2Ur2MUpnxOlKHJBVHPWz/HdHJLxmDIENnY11FuYXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t7Th5bMiQpdMBxlOffFJ+GCJM2I+/UMt2ILZmIDUvSGphvKC6S7bSvhHl/TMfAj5A
	 X+FJbv00VQxKC1CSYo0/gkSm9fbZuqQpNpQCdEz973TtCJsNDrojL+f0o3X8kuVIgu
	 TUFUAXIKiu+/UfljTa/WqSi/kSJH8UQEwKKy24/QL45UcGun3hEMhjChB8yig4rYfD
	 nDfZrNraj/IX0lGbPmsNWgAD0aslWPWQI1T+JOrV8g7xEY4mfNyk8FunhrBvn1q4KF
	 T6ugzDVWW+JuFfYjR8L2EAzn0qOXocLWiKCFlwNJ85f72kiXXXzXLCPJ7PkE9kWN35
	 JNJ3ppTQ47OMw==
Date: Thu, 29 Aug 2024 08:58:45 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: fuse: Move renesas,rcar-{efuse,otp}
 to nvmem
Message-ID: <20240829135845.GA297607-robh@kernel.org>
References: <cover.1721999833.git.geert+renesas@glider.be>
 <1a3d4ff8ce34a5e676d1cb1fafd40525378e29a4.1721999833.git.geert+renesas@glider.be>
 <20240730162435.GA1480758-robh@kernel.org>
 <CAMuHMdUwATmjM3E7WmwnCK739CwuyZH1w_YVYbroDcWEpzh8ig@mail.gmail.com>
 <67hcoj3haiptjh4f7qvaz4xwcdamr3x33xxrxusuwq2t3veiln@z2ggc7razty4>
 <CAMuHMdXSxMzzM6WgwObbymdWHcqUU2r6BOyS7ZzqSBx_gsWftw@mail.gmail.com>
 <c91167d8-df24-4a3c-bb92-811bd1543be3@kernel.org>
 <CAMuHMdUOi-jNLdfnG1iWORa8=EnZjM+DpREsWPyc9RMQwW80SA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUOi-jNLdfnG1iWORa8=EnZjM+DpREsWPyc9RMQwW80SA@mail.gmail.com>

On Thu, Aug 29, 2024 at 11:10:41AM +0200, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Thu, Aug 29, 2024 at 10:55 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On 28/08/2024 22:10, Geert Uytterhoeven wrote:
> > > On Mon, Aug 19, 2024 at 1:11 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >> On Wed, Jul 31, 2024 at 09:37:36AM +0200, Geert Uytterhoeven wrote:
> > >>> On Tue, Jul 30, 2024 at 6:24 PM Rob Herring <robh@kernel.org> wrote:
> > >>>> On Fri, Jul 26, 2024 at 03:38:06PM +0200, Geert Uytterhoeven wrote:
> > >>>>> The R-Car E-FUSE blocks can be modelled better using the nvmem
> > >>>>> framework.
> > >>>>>
> > >>>>> Replace the R-Car V3U example by an R-Car S4-8 ES1.2 example, to show
> > >>>>> the definition of nvmem cells.  While at it, drop unneeded labels from
> > >>>>> the examples, and fix indentation.
> > >>>>>
> > >>>>> Add an entry to the MAINTAINERS file.
> > >>>>>
> > >>>>> Reported-by: Arnd Bergmann <arnd@arndb.de>
> > >>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >>>>> ---
> > >>>>> v3:
> > >>>>>   - New.
> > >>>>>
> > >>>>> I would expect that the calib@144 node needs:
> > >>>>>
> > >>>>>     #nvmem-cell-cells = <0>;
> >
> > So this is for mac-base...
> 
> No, mac-base is not involved.

It is because that's the only case that allows #nvmem-cell-cells in 
fixed-cell.yaml. While fixed-cell.yaml allows additional properties, 
where it is referenced in fixed-layout.yaml does not.

Rob

