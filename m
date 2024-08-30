Return-Path: <linux-renesas-soc+bounces-8566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EA6966604
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 17:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82E641F24702
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 15:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7EE1B5ED6;
	Fri, 30 Aug 2024 15:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/0xvgtj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D559EEC9;
	Fri, 30 Aug 2024 15:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725032842; cv=none; b=f0M81GJp5xfiNlPcuKvtkIobRrLXnURFCxxggsrz2mDcE8wZytmbxHilaQFNPSrQoxLykGzkfgVw5hYMsBbrzN5Ui0hoeIphzO1iptApbX8Sc0EMhqanm2BnXFeYy7qplQWJHbtIBu+rEbrBAkYFrFeSAA1WUMakvdO60imiWkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725032842; c=relaxed/simple;
	bh=kVHG/ikzROeUrI8TkIhYUFF1lltgE9xiBdJrX5pyrqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCRy9jkhxbKhyk0Jo9xc8vS1QXJmcCOtiTgNCXzAsOLktkyCx6XZYAkC/AqVRALdz21Fy9GFW6OymwqiCovHjpjAD7KHpBIGJ2Q6dXzw1/u+q6D6Dn1HPA7STBw6Y3uK6Ils3dwbj1XFsN/Vqke8zzCZ2WOnmaJr2adif2Nf2Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/0xvgtj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FE5C4CEC2;
	Fri, 30 Aug 2024 15:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725032842;
	bh=kVHG/ikzROeUrI8TkIhYUFF1lltgE9xiBdJrX5pyrqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/0xvgtjfTOjVUMrXzxy5584S9c1FzUcDNNifVsobkVn/s380gG5WIvAnEw0P4pAh
	 WfVtqsAKvS9AG8YqUe4+0tyX61k1dd9+oP3oMH/srech142FBW+g+twqx81ZuW9NKE
	 fSpTiX2JU0MUz4P9eGiziQ9n4+h7XRiabQ5YZxqaDr11mx17IPqfAVRxH4OBYr9WSn
	 cTZc5yk9yBRJaygmNSAvGqfItA2n8+zrqfHRM+f0CpA31dZVl1g6MCgEFMENVocrWn
	 nMGqOdHD7+Sulo77E6BHpafwYDVW+irukrZBs0amzmgG1DuHbfa6tpGXpWOOu5RtfO
	 5Bnop4slPp3zw==
Date: Fri, 30 Aug 2024 10:47:19 -0500
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
Message-ID: <20240830154719.GA45646-robh@kernel.org>
References: <cover.1721999833.git.geert+renesas@glider.be>
 <1a3d4ff8ce34a5e676d1cb1fafd40525378e29a4.1721999833.git.geert+renesas@glider.be>
 <20240730162435.GA1480758-robh@kernel.org>
 <CAMuHMdUwATmjM3E7WmwnCK739CwuyZH1w_YVYbroDcWEpzh8ig@mail.gmail.com>
 <67hcoj3haiptjh4f7qvaz4xwcdamr3x33xxrxusuwq2t3veiln@z2ggc7razty4>
 <CAMuHMdXSxMzzM6WgwObbymdWHcqUU2r6BOyS7ZzqSBx_gsWftw@mail.gmail.com>
 <c91167d8-df24-4a3c-bb92-811bd1543be3@kernel.org>
 <CAMuHMdUOi-jNLdfnG1iWORa8=EnZjM+DpREsWPyc9RMQwW80SA@mail.gmail.com>
 <20240829135845.GA297607-robh@kernel.org>
 <CAMuHMdUTju=fZ4x5qAwkrRKF8HxvwyKgBD7aD1rPWHGyGFKD-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUTju=fZ4x5qAwkrRKF8HxvwyKgBD7aD1rPWHGyGFKD-Q@mail.gmail.com>

On Thu, Aug 29, 2024 at 04:34:41PM +0200, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> On Thu, Aug 29, 2024 at 3:58 PM Rob Herring <robh@kernel.org> wrote:
> > On Thu, Aug 29, 2024 at 11:10:41AM +0200, Geert Uytterhoeven wrote:
> > > On Thu, Aug 29, 2024 at 10:55 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > On 28/08/2024 22:10, Geert Uytterhoeven wrote:
> > > > > On Mon, Aug 19, 2024 at 1:11 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > >> On Wed, Jul 31, 2024 at 09:37:36AM +0200, Geert Uytterhoeven wrote:
> > > > >>> On Tue, Jul 30, 2024 at 6:24 PM Rob Herring <robh@kernel.org> wrote:
> > > > >>>> On Fri, Jul 26, 2024 at 03:38:06PM +0200, Geert Uytterhoeven wrote:
> > > > >>>>> The R-Car E-FUSE blocks can be modelled better using the nvmem
> > > > >>>>> framework.
> > > > >>>>>
> > > > >>>>> Replace the R-Car V3U example by an R-Car S4-8 ES1.2 example, to show
> > > > >>>>> the definition of nvmem cells.  While at it, drop unneeded labels from
> > > > >>>>> the examples, and fix indentation.
> > > > >>>>>
> > > > >>>>> Add an entry to the MAINTAINERS file.
> > > > >>>>>
> > > > >>>>> Reported-by: Arnd Bergmann <arnd@arndb.de>
> > > > >>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > >>>>> ---
> > > > >>>>> v3:
> > > > >>>>>   - New.
> > > > >>>>>
> > > > >>>>> I would expect that the calib@144 node needs:
> > > > >>>>>
> > > > >>>>>     #nvmem-cell-cells = <0>;
> > > >
> > > > So this is for mac-base...
> > >
> > > No, mac-base is not involved.
> >
> > It is because that's the only case that allows #nvmem-cell-cells in
> > fixed-cell.yaml. While fixed-cell.yaml allows additional properties,
> > where it is referenced in fixed-layout.yaml does not.
> 
> So all of this is normal, and you should just never use #nvmem-cell-cells,
> except in a node describing the location of the MAC address?

I was just explaining the source. If you have another use, then adjust 
the schema.

> When no #nvmem-cell-cells property is present,
> of_parse_phandle_with_optional_args() (as used in
> of_nvmem_cell_get()) returns zero anyway

Yeah, I don't see much value in disallowing #nvmem-cell-cells.

Rob

