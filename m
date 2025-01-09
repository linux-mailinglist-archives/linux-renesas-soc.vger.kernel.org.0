Return-Path: <linux-renesas-soc+bounces-12011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 650B2A07AF7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 16:05:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5FE63A8E4B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jan 2025 15:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2565422256A;
	Thu,  9 Jan 2025 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3xUV+54"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF701222567;
	Thu,  9 Jan 2025 15:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435010; cv=none; b=d7vqzEXZhHKltALMJY5Sic8fq4qVZ0flv1NN/hAwpQ89zeP9Pl2l/Bo1a0qttd+o9oMxV6pC8NN/00RAPJKv76O1bBt4SrNviBYelhHZi0dnM/KlrUsEXUZ+MeZpNuPy+w+kOLmJMhAxHc4NQqIKp/E4p91RV5bpSH6umWx8DJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435010; c=relaxed/simple;
	bh=agrun0DrMxLjidSALo8ukoreGK4+AaGIYdl9e4F0pr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5Drox/0CWEqyJvrRKfYVs4lXRSm9yVSAJfDeGQjO7eQiELpVQPJhGzECr/sDaJHZeVW/LCHXRuw1bo0fZ3LOzFoC+wAOKxQmb9wBTvDAzmylk90ACf15IT8EPOejKMa8DWXC3LEU+/NDu0ZTSxLNP7ZMKX71EphRgZXcTm7uAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3xUV+54; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5266C4CEE2;
	Thu,  9 Jan 2025 15:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736435009;
	bh=agrun0DrMxLjidSALo8ukoreGK4+AaGIYdl9e4F0pr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U3xUV+54WCTwzeLWyT+yQxHBm/LN8QacCSjyVqvJJ4de2jNpX9tsFAzu+PE8lY/OW
	 Jwvv4OOu70oicR0jDRRp6uys6sGYcZzZcatHdhME0s90bWO2Kea7WhqnZRm0hXJONB
	 MXNi1/L/zJIn4qJy6hfCRsdPH1pET7NjXaQ1ttg+VI61IwurXNVc5xqqx84oVLRajb
	 okswrEFJ9Z6V0MqVBMDQUgnIVy9GTJ4AvuG7wS8AmYTHg2dXYfSVNlLMnMuiofZYSe
	 K1Kyr6XnSZ+Bgipd8Dlt+no1TroW+WN1UvR/Gwk+fr72FYfeYHBV29EnLYvKLP1vGe
	 0AtX+swCdNslw==
Date: Thu, 9 Jan 2025 09:03:27 -0600
From: Rob Herring <robh@kernel.org>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g0: Fix graph_child_address
 warnings from capture pipeline
Message-ID: <20250109150327.GA3352888-robh@kernel.org>
References: <20241016134819.1434340-1-niklas.soderlund+renesas@ragnatech.se>
 <20241209153536.GA74826@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241209153536.GA74826@ragnatech.se>

On Mon, Dec 09, 2024 at 04:35:36PM +0100, Niklas Söderlund wrote:
> Hi Rob,
> 
> Sorry to bother you but I wonder if you could help me understand why the 
> dtc checker warns for the issues I tried to work around in this patch,
> and if possible how I can improve my solution to get rid of the 
> warnings.
> 
> This patch addresses the same problem for a few different devices. I 
> will focus on the last one (/soc/isp@fed00000/ports/port@0) for my 
> question, but all warnings here have the same issue.
> 
> I have a port node the represents a sink for a video input. This sink 
> can either be connected to source A or source B, but not both at the 
> same time. So each possible source is represented by an endpoint in the 
> port node. Each endpoint have specific register address on the port bus 
> that is described in the bindings as they map to different physical pins 
> on the hardware.
> 
> The issue I have is that not all hardware configurations have both 
> source A and B populated. All combinations of A, B and C are possible 
> depending on the platform.
> 
> A)
>     ports {
>         ...
>         port@0 {
>             ...
>             sourceA: endpoint@0 {
>                 reg = <0>
>             };
>             sourceB: endpoint@1 {
>                 reg = <1>
>             };
>         };
>     };
> 
> B)
>     ports {
>         ...
>         port@0 {
>             ...
>             sourceA: endpoint@0 {
>                 reg = <0>
>             };
>         };
>     };
> 
> C)
>     ports {
>         ...
>         port@0 {
>             ...
>             sourceB: endpoint@1 {
>                 reg = <1>
>             };
>         };
>     };
> 
> For option A and C the checker is happy, but for option B the warnings 
> this patch tries to address are triggered. While reading the 
> dtc/checks.c I find check_graph_child_address() is the one that is 
> triggering the warning. And this function explicitly checks for port 
> buses with a single endpoint with a register value of 0.
> 
> This check was added way back in 2018 in commit df536831d02c ("checks: 
> add graph binding checks"). But I can't find any information on the 
> specifics. Is this design a bad idea for port buses for some reason I 
> don't understand? AFIU this design is possible on other type of buses? 
> And do you have any guidance on how I can dig myself out of this hole?

Don't.

The check is only with W=1. It is for cases where there is never more 
than 1 endpoint. dtc can't distinguish when that is the case, so there's 
going to be cases to ignore. Perhaps we could demote it W=2, but I'd 
prefer not to. Making W=1 warning free may be a platform goal, but 
that's not an overall go. If we fix something everywhere, then the check 
is promoted.

Rob

> 
> Thanks for your help.
> 
> On 2024-10-16 15:48:19 +0200, Niklas Söderlund wrote:
> > The bindings for the R-Car video capture pipeline uses ports and
> > endpoints to describe which IP is wired up and present on the different
> > SoCs. It is needed to describe both which instance of an IP is
> > connected, and to which port. The bindings try to be as reusable as
> > possible across the different R-Car generations.
> > 
> > For example R-Car VIN IP bindings have three ports, where two of them
> > can have multiple endpoints. Not all ports or endpoints are physically
> > present on each generation and/or model of R-Car SoCs.
> > 
> > The users of the VIN bindings needs to know not only that a port have
> > one, or more, endpoints but also which particular hardware instance it
> > is. The bindings defines endpoint indexes to correspond to particular
> > hardware instances that can be routed to a port to describe this.
> > 
> > This design leads to warnings when compiling the DTB if a port that can
> > describe more then one endpoint only describes a single endpoint. And
> > that endpoint corresponds to be the hardware the bindings defined to
> > index 0. For example compiling R-Car V4H which includes r8a779g0.dtsi,
> > 
> >    ../r8a779g0.dtsi:1200.12-1210.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
> >    ../r8a779g0.dtsi:1228.12-1238.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
> >    ../r8a779g0.dtsi:1256.12-1266.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
> >    ../r8a779g0.dtsi:1284.12-1294.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
> >    ../r8a779g0.dtsi:1312.12-1322.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
> >    ../r8a779g0.dtsi:1340.12-1350.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
> >    ../r8a779g0.dtsi:1368.12-1378.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
> >    ../r8a779g0.dtsi:1396.12-1406.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
> >    ../r8a779g0.dtsi:2076.12-2086.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are
> > 
> > To avoid these warnings define all possible endpoints for each port in
> > the video capture pipeline, but only set the remote-endpoint property if
> > there is hardware present. This takes care of the warnings, but it also
> > adds empty endpoints that are not connected to anything on that
> > particular SoC.
> > 
> > Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > Hi Geert,
> > 
> > This only addresses the warnings on V4H. More boards do trigger these
> > warnings but before I address them I thought it was a good idea we
> > agreed if this is a good way forward.
> > 
> > In this design I have defined every possible endpoint for the ports
> > involved. This might be a bit excessive as we define endpoints that are
> > not physically possible for V4H. For example V4H only have 2 CSISP
> > instances, while the bindings allow for up-to 4 CSISP as that is
> > possible on V3U which the CSISP bindings are shared with.
> > 
> > I'm not sure where to best draw the line. Only adding empty endpoints if
> > they are possible on the SoC sounds good, but what if we get a board
> > with only a single CSISP for example? That would be a single endpoint
> > with an index of 0, this triggering the warning.
> > 
> > Maybe do the minimum and only define an extra endpoint for ports that
> > trigger the warning? And if it nots pysically possible for that SoC add
> > a comment? This feels wrong however.
> > 
> > Let me know what you think. But it would be nice to get rid of these
> > warnings one way or another.
> > 
> > Kind Regards,
> > Niklas
> > ---
> >  arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 200 ++++++++++++++++++++++
> >  1 file changed, 200 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > index 61c6b8022ffd..e3079562fe65 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> > @@ -1364,6 +1364,18 @@ vin00isp0: endpoint@0 {
> >  						reg = <0>;
> >  						remote-endpoint = <&isp0vin00>;
> >  					};
> > +
> > +					vin00isp1: endpoint@1 {
> > +						reg = <1>;
> > +					};
> > +
> > +					vin00isp2: endpoint@2 {
> > +						reg = <2>;
> > +					};
> > +
> > +					vin00isp3: endpoint@3 {
> > +						reg = <3>;
> > +					};
> >  				};
> >  			};
> >  		};
> > @@ -1393,6 +1405,18 @@ vin01isp0: endpoint@0 {
> >  						reg = <0>;
> >  						remote-endpoint = <&isp0vin01>;
> >  					};
> > +
> > +					vin01isp1: endpoint@1 {
> > +						reg = <1>;
> > +					};
> > +
> > +					vin01isp2: endpoint@2 {
> > +						reg = <2>;
> > +					};
> > +
> > +					vin01isp3: endpoint@3 {
> > +						reg = <3>;
> > +					};
> >  				};
> >  			};
> >  		};
> > @@ -1422,6 +1446,18 @@ vin02isp0: endpoint@0 {
> >  						reg = <0>;
> >  						remote-endpoint = <&isp0vin02>;
> >  					};
> > +
> > +					vin02isp1: endpoint@1 {
> > +						reg = <1>;
> > +					};
> > +
> > +					vin02isp2: endpoint@2 {
> > +						reg = <2>;
> > +					};
> > +
> > +					vin02isp3: endpoint@3 {
> > +						reg = <3>;
> > +					};
> >  				};
> >  			};
> >  		};
> > @@ -1451,6 +1487,18 @@ vin03isp0: endpoint@0 {
> >  						reg = <0>;
> >  						remote-endpoint = <&isp0vin03>;
> >  					};
> > +
> > +					vin03isp1: endpoint@1 {
> > +						reg = <1>;
> > +					};
> > +
> > +					vin03isp2: endpoint@2 {
> > +						reg = <2>;
> > +					};
> > +
> > +					vin03isp3: endpoint@3 {
> > +						reg = <3>;
> > +					};
> >  				};
> >  			};
> >  		};
> > @@ -1480,6 +1528,18 @@ vin04isp0: endpoint@0 {
> >  						reg = <0>;
> >  						remote-endpoint = <&isp0vin04>;
> >  					};
> > +
> > +					vin04isp1: endpoint@1 {
> > +						reg = <1>;
> > +					};
> > +
> > +					vin04isp2: endpoint@2 {
> > +						reg = <2>;
> > +					};
> > +
> > +					vin04isp3: endpoint@3 {
> > +						reg = <3>;
> > +					};
> >  				};
> >  			};
> >  		};
> > @@ -1509,6 +1569,18 @@ vin05isp0: endpoint@0 {
> >  						reg = <0>;
> >  						remote-endpoint = <&isp0vin05>;
> >  					};
> > +
> > +					vin05isp1: endpoint@1 {
> > +						reg = <1>;
> > +					};
> > +
> > +					vin05isp2: endpoint@2 {
> > +						reg = <2>;
> > +					};
> > +
> > +					vin05isp3: endpoint@3 {
> > +						reg = <3>;
> > +					};
> >  				};
> >  			};
> >  		};
> > @@ -1538,6 +1610,18 @@ vin06isp0: endpoint@0 {
> >  						reg = <0>;
> >  						remote-endpoint = <&isp0vin06>;
> >  					};
> > +
> > +					vin06isp1: endpoint@1 {
> > +						reg = <1>;
> > +					};
> > +
> > +					vin06isp2: endpoint@2 {
> > +						reg = <2>;
> > +					};
> > +
> > +					vin06isp3: endpoint@3 {
> > +						reg = <3>;
> > +					};
> >  				};
> >  			};
> >  		};
> > @@ -1567,6 +1651,18 @@ vin07isp0: endpoint@0 {
> >  						reg = <0>;
> >  						remote-endpoint = <&isp0vin07>;
> >  					};
> > +
> > +					vin07isp1: endpoint@1 {
> > +						reg = <1>;
> > +					};
> > +
> > +					vin07isp2: endpoint@2 {
> > +						reg = <2>;
> > +					};
> > +
> > +					vin07isp3: endpoint@3 {
> > +						reg = <3>;
> > +					};
> >  				};
> >  			};
> >  		};
> > @@ -1592,10 +1688,22 @@ port@2 {
> >  
> >  					reg = <2>;
> >  
> > +					vin08isp0: endpoint@0 {
> > +						reg = <0>;
> > +					};
> > +
> >  					vin08isp1: endpoint@1 {
> >  						reg = <1>;
> >  						remote-endpoint = <&isp1vin08>;
> >  					};
> > +
> > +					vin08isp2: endpoint@2 {
> > +						reg = <2>;
> > +					};
> > +
> > +					vin08isp3: endpoint@3 {
> > +						reg = <3>;
> > +					};
> >  				};
> >  			};
> >  		};
> > @@ -1621,10 +1729,22 @@ port@2 {
> >  
> >  					reg = <2>;
> >  
> > +					vin09isp0: endpoint@0 {
> > +						reg = <0>;
> > +					};
> > +
> >  					vin09isp1: endpoint@1 {
> >  						reg = <1>;
> >  						remote-endpoint = <&isp1vin09>;
> >  					};
> > +
> > +					vin09isp2: endpoint@2 {
> > +						reg = <2>;
> > +					};
> > +
> > +					vin09isp3: endpoint@3 {
> > +						reg = <3>;
> > +					};
> >  				};
> >  			};
> >  		};
> > @@ -1650,10 +1770,22 @@ port@2 {
> >  
> >  					reg = <2>;
> >  
> > +					vin10isp0: endpoint@0 {
> > +						reg = <0>;
> > +					};
> > +
> >  					vin10isp1: endpoint@1 {
> >  						reg = <1>;
> >  						remote-endpoint = <&isp1vin10>;
> >  					};
> > +
> > +					vin10isp2: endpoint@2 {
> > +						reg = <2>;
> > +					};
> > +
> > +					vin10isp3: endpoint@3 {
> > +						reg = <3>;
> > +					};
> >  				};
> >  			};
> >  		};
> > @@ -1679,10 +1811,22 @@ port@2 {
> >  
> >  					reg = <2>;
> >  
> > +					vin11isp0: endpoint@0 {
> > +						reg = <0>;
> > +					};
> > +
> >  					vin11isp1: endpoint@1 {
> >  						reg = <1>;
> >  						remote-endpoint = <&isp1vin11>;
> >  					};
> > +
> > +					vin11isp2: endpoint@2 {
> > +						reg = <2>;
> > +					};
> > +
> > +					vin11isp3: endpoint@3 {
> > +						reg = <3>;
> > +					};
> >  				};
> >  			};
> >  		};
> > @@ -1708,10 +1852,22 @@ port@2 {
> >  
> >  					reg = <2>;
> >  
> > +					vin12isp0: endpoint@0 {
> > +						reg = <0>;
> > +					};
> > +
> >  					vin12isp1: endpoint@1 {
> >  						reg = <1>;
> >  						remote-endpoint = <&isp1vin12>;
> >  					};
> > +
> > +					vin12isp2: endpoint@2 {
> > +						reg = <2>;
> > +					};
> > +
> > +					vin12isp3: endpoint@3 {
> > +						reg = <3>;
> > +					};
> >  				};
> >  			};
> >  		};
> > @@ -1737,10 +1893,22 @@ port@2 {
> >  
> >  					reg = <2>;
> >  
> > +					vin13isp0: endpoint@0 {
> > +						reg = <0>;
> > +					};
> > +
> >  					vin13isp1: endpoint@1 {
> >  						reg = <1>;
> >  						remote-endpoint = <&isp1vin13>;
> >  					};
> > +
> > +					vin13isp2: endpoint@2 {
> > +						reg = <2>;
> > +					};
> > +
> > +					vin13isp3: endpoint@3 {
> > +						reg = <3>;
> > +					};
> >  				};
> >  			};
> >  		};
> > @@ -1766,10 +1934,22 @@ port@2 {
> >  
> >  					reg = <2>;
> >  
> > +					vin14isp0: endpoint@0 {
> > +						reg = <0>;
> > +					};
> > +
> >  					vin14isp1: endpoint@1 {
> >  						reg = <1>;
> >  						remote-endpoint = <&isp1vin14>;
> >  					};
> > +
> > +					vin14isp2: endpoint@2 {
> > +						reg = <2>;
> > +					};
> > +
> > +					vin14isp3: endpoint@3 {
> > +						reg = <3>;
> > +					};
> >  				};
> >  			};
> >  		};
> > @@ -1795,10 +1975,22 @@ port@2 {
> >  
> >  					reg = <2>;
> >  
> > +					vin15isp0: endpoint@0 {
> > +						reg = <0>;
> > +					};
> > +
> >  					vin15isp1: endpoint@1 {
> >  						reg = <1>;
> >  						remote-endpoint = <&isp1vin15>;
> >  					};
> > +
> > +					vin15isp2: endpoint@2 {
> > +						reg = <2>;
> > +					};
> > +
> > +					vin15isp3: endpoint@3 {
> > +						reg = <3>;
> > +					};
> >  				};
> >  			};
> >  		};
> > @@ -2251,6 +2443,10 @@ isp0csi40: endpoint@0 {
> >  						reg = <0>;
> >  						remote-endpoint = <&csi40isp0>;
> >  					};
> > +
> > +					isp0csi41: endpoint@1 {
> > +						reg = <1>;
> > +					};
> >  				};
> >  
> >  				port@1 {
> > @@ -2331,6 +2527,10 @@ port@0 {
> >  
> >  					reg = <0>;
> >  
> > +					isp1csi40: endpoint@0 {
> > +						reg = <0>;
> > +					};
> > +
> >  					isp1csi41: endpoint@1 {
> >  						reg = <1>;
> >  						remote-endpoint = <&csi41isp1>;
> > -- 
> > 2.46.2
> > 
> 
> -- 
> Kind Regards,
> Niklas Söderlund

